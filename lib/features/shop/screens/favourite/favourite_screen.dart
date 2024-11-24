// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/products/controller/fav_controller.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:bongo_mart/common/widgets/shimmer/verticle_product_shimmer.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/cloud_helper_functions.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:bongo_mart/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = FavouritesController.instance;
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
            Obx(
              () => FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
                  const loader = MyVerticalProductShimmer(
                    itemCount: 10,
                  );
                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'Woops! Favourite is empty',
                    animation: TImages.pencilAnimation,
                    showAction: true,
                    actionText: 'Let\'s\nfind some products you love',
                    onActionPressed: () {
                      NavigationController.instance.selectedIndex.value = 0;
                      Get.to(() => const NavigationMenu());
                    },
                  );
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget,
                  );
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  return MyGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => MyProductCardVertical(
                      product: products[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
