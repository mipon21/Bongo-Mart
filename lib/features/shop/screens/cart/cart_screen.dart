// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/shop/controllers/product/cart_controller.dart';
import 'package:bongo_mart/features/shop/screens/cart/cart_items.dart';
import 'package:bongo_mart/features/shop/screens/checkout/checkout.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:bongo_mart/utils/loaders/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          Icon(
            Iconsax.shopping_cart,
            size: 25,
            color: isDark ? TColors.light : TColors.dark,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            final emptyWidget = TAnimationLoaderWidget(
              text: 'Woops! Cart is empty',
              animation: TImages.pencilAnimation,
              showAction: true,
              actionText: 'Let\'s\nAdd Some Products to your cart',
              onActionPressed: () {
                NavigationController.instance.selectedIndex.value = 0;
                Get.to(() => const NavigationMenu());
              },
            );

            return cartController.cartItems.isEmpty
                ? emptyWidget
                : Padding(
                    padding: EdgeInsets.all(16),
                    child: MyCartItems(),
                  );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child: Obx(
            () => Text(
                'Checkout ৳${cartController.totalCartPrice.toStringAsFixed(0)}'),
          ),
        ),
      ),
    );
  }
}
