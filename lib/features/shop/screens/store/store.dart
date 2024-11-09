// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/custom_shapes/search_container.dart';
import 'package:bongo_mart/common/widgets/icons/circular_icon.dart';
import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:bongo_mart/common/widgets/tabbar/tabbar.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/screens/brand/all_brand.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/brand_card.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:bongo_mart/navigation_menu.dart';
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
    NavigationController navigationController = Get.put(NavigationController());
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: MyAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            MyCircularFavoriteIcon(
            icon: Iconsax.shop,
            width: 40,
              height: 40,
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
                          MyGridLayout(
                            mainAxisExtent: 80,
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return MyBrandCard();
                            },
                          ),
                        ],
                      ),
                    ),
                    // Tabs Bar
                    bottom: MyTabBar(tabs: [
                      Tab(
                        child: Text('Sports'),
                      ),
                      Tab(
                        child: Text('Furniture'),
                      ),
                      Tab(
                        child: Text('Electronics'),
                      ),
                      Tab(
                        child: Text('Clothing'),
                      ),
                      Tab(
                        child: Text('Others'),
                      ),
                      Tab(
                        child: Text('Mobile'),
                      ),
                    ]))
              ];
            },
            body: TabBarView(children: [
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
              MyCategoryTab(),
            ])),
      ),
    );
  }
}
