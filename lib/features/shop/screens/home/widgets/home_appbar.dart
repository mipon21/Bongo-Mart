// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/features/personalization/controller/user_controller.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.put(NavigationController());
    final controller = Get.put(UserController());
    return MyAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          SizedBox(height: TSizes.spaceBtwItems/2,),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return MyShimmerEffect(height: 25, radius: 5);
              } else {
                return Text(
                  controller.user.value.fullName.isEmpty
                      ? "Sir,"
                      : controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        MyCartCounterIcon(
          onPressed: () {
            navigationController.selectedIndex.value = 2;
          },
          icon: Iconsax.shopping_bag,
          iconColor: TColors.white,
        )
      ],
    );
  }
}
