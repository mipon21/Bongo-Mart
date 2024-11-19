// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/shop/screens/cart/cart_items.dart';
import 'package:bongo_mart/features/shop/screens/checkout/checkout.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
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
        child: Padding(
          padding: EdgeInsets.all(16),
          child: MyCartItems(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: TSizes.md, right: TSizes.md),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child: Text('Checkout ৳ 1000'),
        ),
      ),
    );
  }
}
