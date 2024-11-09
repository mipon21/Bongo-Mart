// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/screens/product_details/widgets/bottom_cart.dart';
import 'package:bongo_mart/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:bongo_mart/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:bongo_mart/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:bongo_mart/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:bongo_mart/features/shop/screens/reviews/product_reviews.dart';
import 'package:bongo_mart/features/shop/screens/reviews/widgets/user_review_card.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/device/device_utility.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final isDesktop = TDeviceUtils.isDesktop(context);
    NavigationController navigationController = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: MyBottomAddToCart(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigationController.selectedIndex.value = 2;
          Get.to(() => NavigationMenu());
        },
        shape: CircleBorder(),
        backgroundColor: isDark ? TColors.secondary : TColors.primary,
        child: Icon(
          Iconsax.shopping_cart,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-----Image Slider-----
            MyProductImageSlider(isDark: isDark),

            //-----Product Details-----

            Padding(
              padding: EdgeInsets.only(
                left: TSizes.defaultSpace / 1.5,
                right: TSizes.defaultSpace / 1.5,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //----- Rating Share Widget -----

                  MyRatingStars(),

                  //----- Price, title, stock & brand -----

                  MyProductMetaData(),

                  //----- attributes -----
                  MyProductAttributes(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  //----- Checkout Button -----
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDark ? TColors.primary : TColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(TSizes.cardRadiusMd),
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Buy Now'),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                  MySectionHeading(title: 'Description'),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'Lorem ipsum dolor sit amet consectetur. Justo faucibus cursus integer at suspendisse. Neque aliquam vestibulum turpis in habitant platea aenean. Neque aliquam vestibulum turpis in habitant platea aenean.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        color: THelperFunctions.isDarkMode(context)
                            ? TColors.secondary
                            : TColors.primary),
                    lessStyle: TextStyle(
                        fontSize: 14,
                        color: THelperFunctions.isDarkMode(context)
                            ? TColors.secondary
                            : TColors.primary),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// -----  review -----
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  MySectionHeading(
                    title: 'Reviews(199)',
                    showViewAll: true,
                    onPressed: () => Get.to(ProductReviews()),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  UserReviewCard(),
                  UserReviewCard(),
                  SizedBox(height: TSizes.spaceBtwItems),
                  MySectionHeading(
                    title: 'More Releted Products',
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  MyGridLayout(
                    itemCount: 4,
                    crossAxisCount: isDesktop ? 6 : 2,
                    itemBuilder: (_, index) => MyProductCardVertical(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),
          ],
        ),
      ),
    );
  }
}
