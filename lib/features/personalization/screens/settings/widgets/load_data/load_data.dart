// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/data/repositories/banner/banner_repository.dart';
import 'package:bongo_mart/data/repositories/brand/brand_repository.dart';
import 'package:bongo_mart/data/repositories/categories/categoy_repository.dart';
import 'package:bongo_mart/data/repositories/product/product_repository.dart';
import 'package:bongo_mart/data/services/dummy_data.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryRepository = CategoryRepository.instance;
    final bannerRepository = BannerRepository.instance;
    final productRepository = ProductRepository.instance;
    final brandRepository = Get.put(BrandRepository());
    return Scaffold(
      appBar: MyAppBar(title: Text('Load Data'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              MySectionHeading(title: 'Main Data'),
              SizedBox(height: TSizes.spaceBtwItems,),
              MySettingsMenuTile(
                onTap: () => categoryRepository.uploadDummyData(MyDummyData.categories),
                icon: Iconsax.category,
                trailing: Icon(Iconsax.arrow_up_1),
                title: 'Upload Categories',
                subtitle: 'Upload Categories to Cloud Firebase',
              ),
              MySettingsMenuTile(
                onTap: () => bannerRepository.uploadDummyData(MyDummyData.banners),
                icon: Iconsax.picture_frame,
                trailing: Icon(Iconsax.arrow_up_1),
                title: 'Upload Banners',
                subtitle: 'Upload Banners to Cloud Firebase',
              ),
              MySettingsMenuTile(
                onTap: () => productRepository.uploadDummyData(MyDummyData.products),
                icon: Iconsax.shopping_bag,
                trailing: Icon(Iconsax.arrow_up_1),
                title: 'Upload Products',
                subtitle: 'Upload Products to Cloud Firebase',
              ),
              MySettingsMenuTile(
                onTap: () => brandRepository.uploadDummyData(MyDummyData.brands),
                icon: Iconsax.shop,
                trailing: Icon(Iconsax.arrow_up_1),
                title: 'Upload Brands',
                subtitle: 'Upload Brands to Cloud Firebase',
              ),
            ],
          ),
        ),
      ),
    );
  }
}