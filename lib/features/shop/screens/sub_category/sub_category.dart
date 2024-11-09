// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/images/my_rounded_image.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'Sports Shoes',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            MyRoundedImage(
              imageUrl: TImages.promoBanner1,
              width: double.infinity,
              applyBorderRadius: true,
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            //SubCategory

            Column(
              children: [
                MySectionHeading(
                  title: 'Sub Categories',
                  showViewAll: true,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              height: 125,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItems),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) => MyProductCardHorizontal(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
