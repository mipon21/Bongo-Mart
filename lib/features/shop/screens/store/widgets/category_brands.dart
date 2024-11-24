// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/features/shop/controllers/product/brand_controller.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/brand_showcase.dart';
import 'package:bongo_mart/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                MyShimmerEffect(height: 70, width: 100),
                Column(
                  children: [
                    MyShimmerEffect(height: 20, width: 100),
                    SizedBox(height: 10),
                    MyShimmerEffect(height: 20, width: 60),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyShimmerEffect(height: 100, width: 100),
                MyShimmerEffect(height: 100, width: 100),
                MyShimmerEffect(height: 100, width: 100),
              ],
            ),
            SizedBox(height: 20),
          ],
        );
        final widget = TCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot,
            loader: loader,
            error: const Text('Error'),
            nothingFound: const Text('No brands found'));
        if (widget != null) {
          return widget;
        }
        final brands = snapshot.data!;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brand.id, limit: 3),
              builder: (context, snapshot) {
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, error: const Text('Error'), nothingFound: const Text('No products found'));
                if (widget != null) {
                  return widget;
                }
                final products = snapshot.data!;
                return MyBrandShowcase(
                  brand: brand,
                  productImages: products.map((e) => e.thumbnail).toList(),
                );
              }
            );
          },
          
        );
      },
    );
  }
}
