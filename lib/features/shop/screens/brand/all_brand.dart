// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/controllers/product/brand_controller.dart';
import 'package:bongo_mart/features/shop/screens/brand/brand_products.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/brand_card.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: MyAppBar(
        title: Text('All Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              MySectionHeading(title: 'Brands'),
              SizedBox(height: TSizes.spaceBtwItems),
              Obx(() {
                if (brandController.isLoading.value) {
                  return MyGridLayout(
                    mainAxisExtent: 80,
                    itemCount: 4,
                    itemBuilder: (_, __) => MyShimmerEffect(
                      width: 300,
                      height: 80,
                    ),
                  );
                }
                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text('No Data Found'),
                  );
                }
                return MyGridLayout(
                  mainAxisExtent: 80,
                  itemCount: brandController.allBrands.length,
                  itemBuilder: (_, index) {
                    final brand = brandController.allBrands[index];
                    return MyBrandCard(
                      brand: brand,
                      onTap: () {
                        Get.to(() => BrandProducts(brand: brand));
                      },
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
