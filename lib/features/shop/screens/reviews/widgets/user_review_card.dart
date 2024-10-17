// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/ratingbar/rating_bar_uni.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {

  const UserReviewCard({super.key});


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage1)),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            MyRatingBarIndicatorUni(
              rating: 4,
              itemSize: 13,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01 Nov 2024',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          'Lorem ipsum dolor sit amet consectetur. Justo faucibus cursus suspendisse ut suspendisse. Ultricies aliquam quisque aliquam suspendisse ut suspendisse. Ultricies aliquam quisque aliquam suspendisse ut suspendisse.',
          trimLines: 2,
          style: Theme.of(context).textTheme.bodyMedium,
          colorClickableText: TColors.primary,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        MyRoundedContainer(
          backgroundColor: isDark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bongo Mart",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    Text(
                      "01 Nov 2024",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                ReadMoreText(
                  'Lorem ipsum dolor sit amet consectetur. Justo faucibus cursus suspendisse ut suspendisse. Ultricies aliquam quisque aliquam suspendisse ut suspendisse. Ultricies aliquam quisque aliquam suspendisse ut suspendisse.',
                  trimLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium,
                  colorClickableText:
                       TColors.primary,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
