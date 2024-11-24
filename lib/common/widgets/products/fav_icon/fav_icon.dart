// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/widgets/icons/circular_icon.dart';
import 'package:bongo_mart/common/widgets/products/controller/fav_controller.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyFavoriteIcon extends StatelessWidget {
  const MyFavoriteIcon({super.key, required this.productId});


  final String productId;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(FavouritesController());
    return Obx(
      () {
        return MyCircularFavoriteIcon(
          icon: controller.favourites[productId] ?? false ? Iconsax.heart5 : Iconsax.heart,
          width: 40,
          backgroundColor:  isDark
              ? Colors.white.withOpacity(0.16)
              : TColors.black.withOpacity(0.16),
              
          height: 40,
          color: controller.isFavorite(productId)? TColors.error : Colors.white,
          onPressed: () => controller.toggleFavoriteProduct(productId),
        );
      },
    );
  }
}
