// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/coice_chip/choice_chip.dart';
import 'package:bongo_mart/common/widgets/text/product_price.dart';
import 'package:bongo_mart/common/widgets/text/product_title.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyProductAttributes extends StatelessWidget {
  const MyProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        //----- Selected Atribute Pricing -----
        MyRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: isDark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // Title, Price, Stock Status
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySectionHeading(title: 'Variation:'),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      MyProductTitle(title: 'Price:'),
                      SizedBox(width: TSizes.spaceBtwItems / 2),
                      Text(
                        '\$250.00',
                        style: Theme.of(context).textTheme.titleSmall!.apply(
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                      SizedBox(width: TSizes.spaceBtwItems / 2),
                      MyProductPrice(
                        price: '170.00',
                        isLarge: false,
                      )
                    ],
                  ),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      MyProductTitle(title: 'Stock:'),
                      SizedBox(width: TSizes.spaceBtwItems / 2),
                      Text(
                        'In Stock',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  )
                ],
              ),
              // Variation Description

              MyProductTitle(
                title:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget sapien. Sed ut purus eget sapien.',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        //----- Product Attributes -----

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(title: 'Color'),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                MyCoiceChip(
                  isDark: isDark,
                  title: 'Green',
                  isSelected: false,
                  onSelected: (value) {},
                ),
                MyCoiceChip(
                  isDark: isDark,
                  title: 'Blue',
                  isSelected: true,
                  onSelected: (value) {},
                ),
                MyCoiceChip(
                  isDark: isDark,
                  title: 'Yellow',
                  isSelected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(title: 'Size'),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                MyCoiceChip(
                  isDark: isDark,
                  title: 'EU 34',
                  isSelected: false,
                  onSelected: (value) {},
                ),
                MyCoiceChip(
                  isDark: isDark,
                  title: 'EU 36',
                  isSelected: true,
                  onSelected: (value) {},
                ),
                MyCoiceChip(
                  isDark: isDark,
                  title: 'EU 38',
                  isSelected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
