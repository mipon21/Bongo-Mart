// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/icons/brand_title_with_verified_icon.dart';
import 'package:bongo_mart/common/widgets/icons/circular_icon.dart';
import 'package:bongo_mart/common/widgets/images/my_circular_Image.dart';
import 'package:bongo_mart/common/widgets/images/my_rounded_image.dart';
import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/common/widgets/text/product_price.dart';
import 'package:bongo_mart/common/widgets/text/product_title.dart';
import 'package:bongo_mart/features/shop/controllers/product/product_controller.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/features/shop/screens/product_details/product_details.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/enum/enums.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyProductCardVertical extends StatelessWidget {
  const MyProductCardVertical({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;

    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final stockStatus = controller.getProductStockStatus(product.stock);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          //boxShadow: [MyShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: isDark ? TColors.secondary : TColors.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Thumbnail, wishlist icon, discount label
            Flexible(
              child: MyRoundedContainer(
                width: double.infinity,
                height: 150,
                padding: EdgeInsets.all(TSizes.sm),
                backgroundColor: isDark ? TColors.secondary : TColors.grey,
                child: Stack(
                  children: [
                    //Thumbnail Image
                    if (controller.isLoading.value)
                      MyShimmerEffect()
                    else
                      MyRoundedImage(
                        padding: EdgeInsets.zero,
                        height: double.infinity,
                        width: double.infinity,
                        backgroundColor: isDark
                            ? TColors.secondary
                            : TColors.light.withOpacity(0.2),
                        fit: BoxFit.contain,
                        imageUrl: product.thumbnail,
                        isNetworkImage: true,
                        applyBorderRadius: true,
                      ),
                    Positioned(
                      top: 6,
                      left: 6,
                      child: MyRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: isDark
                            ? TColors.primary.withOpacity(0.7)
                            : TColors.primary.withOpacity(0.8),
                        padding: EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          "$salePercentage% off",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.white),
                        ),
                      ),
                    ),

                    //Favourite icon
                    Positioned(
                        right: 2,
                        top: 0,
                        child: MyCircularFavoriteIcon(
                          icon: Iconsax.heart5,
                          width: 40,
                          height: 40,
                          color: Colors.red,
                        ))

                    //Discount label
                  ],
                ),
              ),
            ),

            //-------------Details-------------//
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyProductTitle(
                      title: product.title,
                      smallSize: true,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    MyBrandTitleWithVerifiedIcon(
                      title: product.brand != null ? product.brand!.name : '',
                      brandTitleSize: TextSizes.medium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              if (product.productType ==
                                      ProductType.single.toString() &&
                                  product.salePrice > 0)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "৳${product.price.toStringAsFixed(0)}",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: TColors.darkGrey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    MyProductPrice(
                                      price:
                                          product.salePrice.toStringAsFixed(0),
                                    ),
                                  ],
                                ),
                              if (product.productType ==
                                      ProductType.variable.toString() &&
                                  product.salePrice > 0)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.getLargestProductPrice(product),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: TColors.darkGrey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    MyProductPrice(
                                      price:
                                          controller.getProductPrice(product),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        // SizedBox(width: TSizes.xs),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //       bottom: TSizes.sm / 2, right: TSizes.sm / 2),
                        //   decoration: BoxDecoration(
                        //     color: TColors.dark,
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(TSizes.cardRadiusMd),
                        //       bottomRight:
                        //           Radius.circular(TSizes.productImageRadius),
                        //     ),
                        //   ),
                        //   child: SizedBox(
                        //     width: TSizes.iconLg * 1.2,
                        //     height: TSizes.iconLg * 1.2,
                        //     child: Center(
                        //       child: Icon(
                        //         Iconsax.add,
                        //         color: TColors.white,
                        //         size: TSizes.iconLg,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Iconsax.star5,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: product.rating.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(fontSizeDelta: -2)),
                              TextSpan(
                                  text: ' (${product.ratingCount})',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          fontSizeDelta: -2,
                                          overflow: TextOverflow.ellipsis)),
                            ])),
                          ],
                        ),
                        Flexible(
                          child: Text(
                            stockStatus,
                            style: Theme.of(context).textTheme.bodySmall!.apply(
                                fontSizeDelta: -2,
                                color: stockStatus == "In Stock"
                                    ? Colors.green
                                    : stockStatus == "Out of Stock"
                                        ? Colors.red
                                        : stockStatus == "Low Stock"
                                            ? Colors.orange
                                            : Colors.orangeAccent,
                                overflow: TextOverflow.ellipsis),
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
