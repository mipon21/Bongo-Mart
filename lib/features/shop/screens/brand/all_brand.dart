// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/screens/all_products/all_products.dart';
import 'package:bongo_mart/features/shop/screens/brand/brand_products.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/brand_card.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              MyGridLayout(    
                itemCount: 20,
                mainAxisExtent: 100,
                itemBuilder: (_, index) => MyBrandCard(
                  onTap: () {
                    Get.to(() => BrandProducts());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
