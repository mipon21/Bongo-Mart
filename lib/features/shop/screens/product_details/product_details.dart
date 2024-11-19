// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/controllers/product/product_controller.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
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
import 'package:bongo_mart/utils/enum/enums.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    NavigationController navigationController = Get.put(NavigationController());
    final controller = ProductController.instance;

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
            MyProductImageSlider(product: product),

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

                  MyRatingStars(product: product),

                  //----- Price, title, stock & brand -----

                  MyProductMetaData(product: product),

                  //----- attributes -----
                  if (product.productType == ProductType.variable.toString())
                  MyProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString())
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                  MySectionHeading(title: 'Description'),
                  SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? '',
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
                  SizedBox(height: TSizes.spaceBtwSections),
                  //----- Buy Now Button -----
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
                    itemCount: 10,
                    itemBuilder: (_, index) => MyProductCardVertical(
                      product: ProductModel.empty(),
                    ),
                  )
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
