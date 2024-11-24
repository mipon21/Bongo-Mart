// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, curly_braces_in_flow_control_structures

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/coice_chip/choice_chip.dart';
import 'package:bongo_mart/common/widgets/text/product_price.dart';
import 'package:bongo_mart/common/widgets/text/product_title.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/controllers/product/product_controller.dart';
import 'package:bongo_mart/features/shop/controllers/product/variation_controller.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class MyProductAttributes extends StatelessWidget {
  const MyProductAttributes({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    final productController = ProductController.instance;
   

    return Obx(
      () {
        return Column(
          children: [
            //----- Selected Atribute Pricing -----
            if (controller.selectedVariation.value.id.isNotEmpty)
              MyRoundedContainer(
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: isDark ? TColors.darkerGrey : TColors.grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title, Price, Stock Status
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MySectionHeading(title: 'Variation:'),
                        SizedBox(width: TSizes.spaceBtwItems / 2),
                        Row(
                          children: [
                            MyProductTitle(
                              title: 'Price:',
                              smallSize: true,
                            ),
                            SizedBox(width: TSizes.spaceBtwItems / 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Text(
                                    "৳${controller.selectedVariation.value.price.toStringAsFixed(0)}",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: TColors.darkGrey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                SizedBox(width: 8),
                                MyProductPrice(
                                  price: controller.getVariationPrice(),
                                  isLarge: true,
                                ),
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  SizedBox(width: 8),
                                if (controller
                                        .selectedVariation.value.salePrice >
                                    0)
                                  Obx(() {
                                    final salePercentage = productController
                                        .calculateSalePercentage(
                                          controller
                                              .selectedVariation.value.price,
                                          controller.selectedVariation.value
                                              .salePrice,
                                        )
                                        .obs;
                                    return MyRoundedContainer(
                                      radius: TSizes.sm,
                                      backgroundColor:
                                          TColors.primary.withOpacity(0.8),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: TSizes.sm,
                                          vertical: TSizes.xs),
                                      child: Text(
                                        '-$salePercentage% off',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .apply(color: TColors.white),
                                      ),
                                    );
                                  }),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: TSizes.spaceBtwItems / 2),
                        Row(
                          children: [
                            MyProductTitle(
                              title: 'Stock:',
                              smallSize: true,
                            ),
                            SizedBox(width: TSizes.spaceBtwItems / 2),
                            Text(
                              controller.variationStockStatus.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(
                                    color: controller
                                                .variationStockStatus.value ==
                                            "In Stock"
                                        ? Colors.green
                                        : controller.variationStockStatus
                                                    .value ==
                                                "Out of Stock"
                                            ? Colors.red
                                            : controller.variationStockStatus
                                                        .value ==
                                                    "Low Stock"
                                                ? Colors.orange
                                                : Colors.orangeAccent,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ],
                        )
                      ],
                    ),
                    // Variation Description
                    if (controller
                        .selectedVariation.value.description!.isNotEmpty)
                      MyProductTitle(
                        title: 'Description:',
                        smallSize: true,
                      ),
                    ReadMoreText(
                      controller.selectedVariation.value.description ?? '',
                      trimLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium,
                      colorClickableText: TColors.primary,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                    ),
                  ],
                ),
              ),
            SizedBox(height: TSizes.spaceBtwItems),

            //----- Product Attributes -----
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map(
                    
                    (attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MySectionHeading(title: attribute.name ?? ''),
                        SizedBox(height: TSizes.spaceBtwItems / 2),
                        Obx(
                          () {
                            return Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);
                                
                                return MyCoiceChip(
                                  title: attributeValue,
                                  isSelected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue,
                                            );
                                          }
                                        }
                                      : null,
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
