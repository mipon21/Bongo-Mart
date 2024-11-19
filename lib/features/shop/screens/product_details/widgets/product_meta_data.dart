// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/icons/brand_title_with_verified_icon.dart';
import 'package:bongo_mart/common/widgets/images/my_circular_Image.dart';
import 'package:bongo_mart/common/widgets/text/product_price.dart';
import 'package:bongo_mart/common/widgets/text/product_title.dart';
import 'package:bongo_mart/features/shop/controllers/product/product_controller.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/enum/enums.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyProductMetaData extends StatelessWidget {
  const MyProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final stockStatus = controller.getProductStockStatus(product.stock);    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //----- Price -----
        Row(
          children: [
            if (salePercentage != null && salePercentage.isNotEmpty)
              MyRoundedContainer(
                radius: TSizes.sm,
              backgroundColor: isDark
                  ? TColors.primary.withOpacity(0.7)
                  : TColors.primary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '$salePercentage% off',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.white),
              ),
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "৳${product.price.toStringAsFixed(0)}",
                    style: TextStyle(
                      fontSize: 17,
                      color: TColors.darkGrey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 4),
                  MyProductPrice(
                    price: product.salePrice.toStringAsFixed(0),
                    isLarge: true,
                  ),
                ],
              ),
            if (product.productType == ProductType.variable.toString() &&
                product.salePrice > 0)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.getLargestProductPrice(product),
                    style: TextStyle(
                      fontSize: 17,
                      color: TColors.darkGrey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 4),
                  MyProductPrice(
                    price: controller.getProductPrice(product),
                    isLarge: true,
                  ),
                ],
              )
          ],
        ),

        //----- Title -----
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        MyProductTitle(
          title: product.title,
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),
        //----- Stock -----
        Row(
          children: [
            MyProductTitle(
              title: 'Status:',
              smallSize: true,
            ),
            SizedBox(width: TSizes.spaceBtwItems),
            Text(
              stockStatus,
              style: Theme.of(context).textTheme.titleMedium!.apply(
                  color: stockStatus == "In Stock"
                      ? Colors.green
                      : stockStatus == "Out of Stock"
                          ? Colors.red
                          : stockStatus == "Low Stock"
                              ? Colors.orange
                              : Colors.orangeAccent,
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //----- Brand -----
        Row(
          children: [
            MyCircularImage(
              isDark: isDark,
              overlayColor: isDark ? TColors.white : TColors.black,
              imageUrl: product.brand != null ? product.brand!.image : '',
              width: 40,
              height: 40,
              isNetworkImage: true,
            ),
            MyBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTitleSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
