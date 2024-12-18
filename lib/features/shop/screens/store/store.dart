// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/custom_shapes/search_container.dart';
import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/common/widgets/tabbar/tabbar.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/controllers/category/category_controller.dart';
import 'package:bongo_mart/features/shop/controllers/product/brand_controller.dart';
import 'package:bongo_mart/features/shop/screens/brand/all_brand.dart';
import 'package:bongo_mart/features/shop/screens/brand/brand_products.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/brand_card.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: MyAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            Icon(
              Iconsax.shop,
              size: 25,
              color: isDark ? TColors.light : TColors.dark,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: isDark ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      //Search Bar
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      MySearchContainer(
                        text: 'Search in Store',
                        icon: Iconsax.search_normal,
                        showBackground: false,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      //Featured Brands
                      MySectionHeading(
                        title: 'Featured Brands',
                        showViewAll: true,
                        onPressed: () {
                          Get.to(() => AllBrandScreen());
                        },
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
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
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text('No Data Found'),
                          );
                        }
                        return MyGridLayout(
                          mainAxisExtent: 80,
                          itemCount: brandController.featuredBrands.length,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
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
                // Tabs Bar
                bottom: MyTabBar(
                  tabs: categories
                      .map((category) => Tab(text: category.name))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => MyCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
