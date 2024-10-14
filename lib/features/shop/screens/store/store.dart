// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/custom_shapes/search_container.dart';
import 'package:bongo_mart/common/widgets/icons/brand_title_with_verified_icon.dart';
import 'package:bongo_mart/common/widgets/images/my_circular_Image.dart';
import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/device/device_utility.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          MyCartCounterIcon(
            onPressed: () {},
            iconColor: isDark ? TColors.white : TColors.dark,
          ),
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
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      MyGridLayout(
                        mainAxisExtent: 80,
                          itemCount: 4,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: MyRoundedContainer(
                                padding: EdgeInsets.all(TSizes.sm),
                                showBorder: true,
                                backgroundColor: Colors.transparent,
                                child: Row(
                                  children: [
                                    //Icon
                                    Flexible(
                                      child: MyCircularImage(
                                        isDark: isDark,
                                        imageUrl: TImages.clothIcon,
                                        backgroundColor: Colors.transparent,
                                        overlayColor:
                                            isDark ? TColors.white : TColors.dark,
                                      ),
                                    ),
                                    SizedBox(width: TSizes.spaceBtwItems / 2),
                                    //Brand Name
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyBrandTitleWithVerifiedIcon(
                                            title: 'Nike',
                                            brandTitleSize: TextSizes.large,
                                          ),
                                          SizedBox(
                                              height: TSizes.spaceBtwItems / 3),
                                          Text(
                                            '256 products',
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    )

                                    //Brand Logo
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ))
          ];
        },
        body: Container(
            // Add your body content here
            ),
      ),
    );
  }
}
