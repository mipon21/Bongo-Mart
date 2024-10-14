// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:bongo_mart/common/widgets/custom_shapes/search_container.dart';
import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/device/device_utility.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final isDesktop = TDeviceUtils.isDesktop(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyPrimaryHeaderContainer(
                child: Column(
              children: [
                MyHomeAppBar(),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                //SearchBar
                MySearchContainer(
                  icon: Iconsax.search_normal,
                  text: "Search in Store ...",
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: TSizes.defaultSpace,
                  ),
                  child: Column(
                    children: [
                      MySectionHeading(
                        title: 'Popular Categories',
                        titleColor: TColors.white,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      MyHomeCategories(),
                    ],
                  ),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace/2),
              child: Column(
                children: [
                  MyPromoSlider(
                    autoPlay: true,
                    promoImages: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                   SizedBox(
                    height: TSizes.spaceBtwSections/2,
                  ),
                  MySectionHeading(
                    title: 'Popular Products',
                    showViewAll: true,
                    onPressed: () {},
                  ),

                  SizedBox(
                    height: TSizes.spaceBtwSections/2,
                  ),
                  //--Popular Products--//

                  MyGridLayout(
                    itemCount: 10,
                    crossAxisCount: isDesktop ? 6 : 2,
                    itemBuilder: (_, index) => MyProductCardVertical(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
