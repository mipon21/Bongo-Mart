// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bongo_mart/common/widgets/shimmer/verticle_product_shimmer.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/controllers/category/category_controller.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/features/shop/screens/all_products/all_products.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/category_brands.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCategoryTab extends StatelessWidget {
  const MyCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // SizedBox(height: TSizes.spaceBtwSections*2),
              //--Brands
              CategoryBrands(category: category),
              FutureBuilder(
                  future: controller.getCategoryProducts(category.id),
                  builder: (context, snapshot) {
                    const loader = MyVerticalProductShimmer(
                      itemCount: 10,
                    );

                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                    );
                    if (widget != null) return widget;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        MySectionHeading(
                          title: 'You may also like',
                          showViewAll: true,
                          onPressed: () => Get.to(
                            () => AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                category.id,
                                limit: -1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        MyGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => MyProductCardVertical(
                            product: products[index],
                          ),
                        )
                      ],
                    );
                  }),

              //--Products
            ],
          ),
        ),
      ],
    );
  }
}
