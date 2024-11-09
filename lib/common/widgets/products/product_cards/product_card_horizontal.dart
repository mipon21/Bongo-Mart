// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/icons/brand_title_with_verified_icon.dart';
import 'package:bongo_mart/common/widgets/icons/circular_icon.dart';
import 'package:bongo_mart/common/widgets/images/my_rounded_image.dart';
import 'package:bongo_mart/common/widgets/text/product_price.dart';
import 'package:bongo_mart/common/widgets/text/product_title.dart';
import 'package:bongo_mart/features/shop/screens/product_details/product_details.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:bongo_mart/utils/theme/widget_themes/shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyProductCardHorizontal extends StatelessWidget {
  const MyProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails()),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: isDark ? TColors.secondary : TColors.grey,
        ),
        child: Row(
          children: [
            //Thumbnail, wishlist icon, discount label
            MyRoundedContainer(
              padding: EdgeInsets.all(TSizes.sm),
              //showBorder: true,
              backgroundColor:
                  isDark ? TColors.secondary : TColors.light.withOpacity(0.2),
              child: Stack(
                children: [
                  //Thumbnail Image
                  MyRoundedImage(
                    width: 120,
                    height: 120,
                    backgroundColor: isDark
                        ? TColors.secondary
                        : TColors.light.withOpacity(0.2),
                    imageUrl: TImages.productImage1,
                  ),

                  //Wishlist icon

                  //Favourite icon
                  Positioned(
                    left: 0,
                    top: 0,
                    child: MyCircularFavoriteIcon(
                      icon: Iconsax.heart5,
                      width: 40,
                      height: 40,
                      color: Colors.red,
                    ),
                  )

                  //Discount label
                ],
              ),
            ),

            //Details
            SizedBox(
              width: 170,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyProductTitle(
                          title: 'Nike Air Max 90 ',
                          maxLines: 1,
                          smallSize: true,
                        ),
                        MyBrandTitleWithVerifiedIcon(
                          title: 'Nike',
                          brandTitleSize: TextSizes.small,

                        ),
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyProductPrice(
                          price: '1800',
                          isLarge: true,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.productImageRadius),
                            ),
                          ),
                          child: SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: TColors.white,
                                size: TSizes.iconLg,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
