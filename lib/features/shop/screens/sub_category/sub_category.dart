// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/images/my_rounded_image.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_horizontal_tst.dart';
import 'package:bongo_mart/common/widgets/products/sortable/sortable_products.dart';
import 'package:bongo_mart/common/widgets/shimmer/horizontal_product_shimmer.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/controllers/category/category_controller.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/features/shop/screens/all_products/all_products.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          category.name,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            MyRoundedImage(
              imageUrl: TImages.promoBanner1,
              width: double.infinity,
              applyBorderRadius: true,
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            //SubCategory

            FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {
                  const loader = MyHorizontalProductShimmer();

                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    // nothingFound: Text('No sub categories found'),
                    // error: Text('Error fetching sub categories'),
                  );
                  if (widget != null) return widget;

                  final subCategories = snapshot.data!;

                  return ListView.builder(
                      itemCount: subCategories.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        return FutureBuilder(
                            future:
                                controller.getCategoryProducts(subCategory.id),
                            builder: (context, snapshot) {
                              final widget =
                                  TCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot,
                                loader: loader,
                                nothingFound: Text('No sub categories found'),
                                error: Text('Error fetching sub categories'),
                              );
                              if (widget != null) return widget;

                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  MySectionHeading(
                                    title: subCategory.name,
                                    showViewAll: true,
                                    onPressed: () {
                                      Get.to(
                                        () => AllProducts(
                                          title: subCategory.name,
                                          futureMethod:
                                              controller.getCategoryProducts(
                                                  subCategory.id),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: TSizes.spaceBtwItems / 2),
                                  SizedBox(
                                    height: 145,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: TSizes.spaceBtwItems),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: products.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          MyProductCardHorizontal(
                                        product: products[index],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      });
                }),
          ],
        ),
      ),
    );
  }
}
