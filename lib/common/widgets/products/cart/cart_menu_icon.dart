import 'package:bongo_mart/features/shop/controllers/product/cart_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyCartCounterIcon extends StatelessWidget {
  const MyCartCounterIcon({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.iconColor,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    final cartController = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.secondary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  cartController.noOfCartItems.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: TColors.white,
                      ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
