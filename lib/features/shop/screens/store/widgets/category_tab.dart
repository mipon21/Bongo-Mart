// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/brand_showcase.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyCategoryTab extends StatelessWidget {
  const MyCategoryTab({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
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
              MyBrandShowcase(productImages: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3,
              ]),
              MyBrandShowcase(productImages: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3,
              ]),
              MySectionHeading(
                title: 'You may also like',
                showViewAll: true,
                onPressed: () {},
              ),
              SizedBox(height: TSizes.spaceBtwItems),

               MyGridLayout(
              itemCount: 10,
              itemBuilder: (_, index) => MyProductCardVertical(
                product: ProductModel.empty(),
              ),
            )

              //--Products
            ],
          ),
        ),
      ],
    );
  }
}
