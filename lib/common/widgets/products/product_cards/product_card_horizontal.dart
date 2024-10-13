// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/images/my_rounded_image.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:bongo_mart/utils/theme/widget_themes/shadow.dart';
import 'package:flutter/material.dart';

class MyProductCardHorizontal extends StatelessWidget {
  const MyProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [MyShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: isDark ? TColors.darkerGrey : TColors.white,
      ),
      child: Column(
        children: [
          //Thumbnail, wishlist icon, discount label
          
          MyRoundedContainer(
            height: 180,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: isDark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                //Thumbnail Image

                MyRoundedImage(
                  imageUrl: TImages.productImage1
                )

                //Wishlist icon

                //Discount label
              ],
            ),
          )

          //Details

          
        ],
      ),
    );
  }
}