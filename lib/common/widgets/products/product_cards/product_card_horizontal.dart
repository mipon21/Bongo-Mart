// ignore_for_file: unused_local_variable, prefer_const_constructors
import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/icons/brand_title_with_verified_icon.dart';
import 'package:bongo_mart/common/widgets/icons/circular_icon.dart';
import 'package:bongo_mart/common/widgets/images/my_rounded_image.dart';
import 'package:bongo_mart/common/widgets/products/fav_icon/fav_icon.dart';
import 'package:bongo_mart/common/widgets/text/product_price.dart';
import 'package:bongo_mart/common/widgets/text/product_title.dart';
import 'package:bongo_mart/features/shop/controllers/product/product_controller.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/features/shop/screens/favourite/favourite_screen.dart';
import 'package:bongo_mart/features/shop/screens/product_details/product_details.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bongo_mart/utils/enum/enums.dart';
import 'package:iconsax/iconsax.dart';

class MyProductCardHorizontal extends StatelessWidget {
  const MyProductCardHorizontal({super.key, required this.product});

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
                    imageUrl: product.thumbnail,
                    fit: BoxFit.cover,
                    isNetworkImage: true,
                  ),

                  //Wishlist icon

                  //Favourite icon
                  Positioned(
                      left: 0,
                      top: 0,
                      child: MyFavoriteIcon(
                        productId: product.id,
                      ))

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
                          title: product.title,
                          maxLines: 1,
                          smallSize: true,
                        ),
                        MyBrandTitleWithVerifiedIcon(
                          title:
                              product.brand != null ? product.brand!.name : '',
                          brandTitleSize: TextSizes.medium,
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
                        "$salePercentage% off",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.white),
                      ),
                    ),
                    SizedBox(height: 2,),
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
                                    if (product.price > 0)
                                      Text(
                                        "৳${product.price.toStringAsFixed(0)}",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: TColors.darkGrey,
                                          decoration:
                                              TextDecoration.lineThrough,
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
                                      controller
                                          .getLargestProductPrice(product),
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

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     MyProductPrice(
                    //       price: product.price.toString(),
                    //       isLarge: true,
                    //     ),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //         color: TColors.dark,
                    //         borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(TSizes.cardRadiusMd),
                    //           bottomRight:
                    //               Radius.circular(TSizes.productImageRadius),
                    //         ),
                    //       ),
                    //       child: SizedBox(
                    //         width: TSizes.iconLg * 1.2,
                    //         height: TSizes.iconLg * 1.2,
                    //         child: Center(
                    //           child: Icon(
                    //             Iconsax.add,
                    //             color: TColors.white,
                    //             size: TSizes.iconLg,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
