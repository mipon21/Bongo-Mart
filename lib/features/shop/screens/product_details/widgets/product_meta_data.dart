// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/icons/brand_title_with_verified_icon.dart';
import 'package:bongo_mart/common/widgets/images/my_circular_Image.dart';
import 'package:bongo_mart/common/widgets/text/product_price.dart';
import 'package:bongo_mart/common/widgets/text/product_title.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyProductMetaData extends StatelessWidget {
  const MyProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //----- Price -----
        Row(
          children: [
            MyRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: isDark
                  ? TColors.primary.withOpacity(0.7)
                  : TColors.primary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25% off',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.white),
              ),
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(
              '\$250.00',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            MyProductPrice(
              price: '170.00',
              isLarge: true,
            )
          ],
        ),

        //----- Title -----
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        MyProductTitle(title: 'Nike Air Max 270'),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        //----- Stock -----
        Row(
          children: [
            MyProductTitle(title: 'Status:'),
            SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock'),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //----- Brand -----
        Row(
          children: [
            MyCircularImage(
              isDark: isDark,
              overlayColor: isDark ? TColors.white : TColors.black,
              imageUrl: TImages.nikeLogo,
              width: 32,
              height: 32,
            ),
            MyBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTitleSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
