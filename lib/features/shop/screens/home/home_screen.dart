// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/custom_shapes/search_container.dart';
import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bongo_mart/common/widgets/shimmer/verticle_product_shimmer.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/controllers/product/product_controller.dart';
import 'package:bongo_mart/features/shop/screens/all_products/all_products.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyPrimaryHeaderContainer(
                child: Column(
              children: [
                MyHomeAppBar(),
                SizedBox(
                  height: TSizes.spaceBtwSections / 2,
                ),
                //SearchBar
                MySearchContainer(
                  icon: Iconsax.search_normal,
                  text: "Search in Store ...",
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections / 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: TSizes.defaultSpace,
                    bottom: TSizes.spaceBtwSections / 4,
                  ),
                  child: Column(
                    children: [
                      MySectionHeading(
                        title: 'Popular Categories',
                        titleColor: TColors.white,
                      ),
                      MyHomeCategories(),
                    ],
                  ),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
              child: Column(
                children: [
                  MyPromoSlider(
                    autoPlay: true,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections / 2,
                  ),
                  MySectionHeading(
                    title: 'Popular Products',
                    showViewAll: true,
                    onPressed: () {
                      Get.to(() => AllProducts());
                    },
                  ),

                  SizedBox(
                    height: TSizes.spaceBtwSections / 2,
                  ),
                  //--Popular Products--//

                  Obx(() {
                    if (controller.isLoading.value) {
                      return MyVerticalProductShimmer(
                          itemCount: controller.products.length);
                    }
                    if (controller.products.isEmpty) {
                      return const Center(child: Text("No products found"));
                    }
                    return MyGridLayout(
                      itemCount: controller.products.length,
                      crossAxisCount: 2,
                      itemBuilder: (_, index) => MyProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
