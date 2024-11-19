// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'Favourite',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          Icon(
            Iconsax.heart,
            size: 25,
              color: isDark ? TColors.light : TColors.dark,
            )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            MyGridLayout(
              itemCount: 10,
              itemBuilder: (_, index) => MyProductCardVertical(
                product: ProductModel.empty(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
