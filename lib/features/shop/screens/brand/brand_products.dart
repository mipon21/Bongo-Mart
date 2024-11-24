// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/products/sortable/sortable_products.dart';
import 'package:bongo_mart/common/widgets/shimmer/verticle_product_shimmer.dart';
import 'package:bongo_mart/features/shop/controllers/product/brand_controller.dart';
import 'package:bongo_mart/features/shop/models/brand_model.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/brand_card.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: MyAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              MyBrandCard(
                brand: brand,
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              FutureBuilder(
                  future: controller.getBrandProducts(brand.id),
                  builder: (context, snapshot) {
                    const loader = MyVerticalProductShimmer(
                      itemCount: 10,
                    );

                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                    );
                    if (widget != null) return widget;
                    return MySortableProducts(products: snapshot.data ?? []);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
