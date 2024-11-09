// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/shop/screens/order/widgets/order_list_item.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.put(NavigationController());
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: false,
        leadingIcon: Icons.arrow_back_ios_new,
        leadingOnPressed: () {
          navigationController.selectedIndex.value = 0;
          Get.offAll(() => const NavigationMenu());
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: MyOrderListItem(),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: TSizes.defaultSpace,
          right: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace,
        ),
        child: ElevatedButton(
          onPressed: () {
            navigationController.selectedIndex.value = 0;
            Get.offAll(() => const NavigationMenu());
          },
          child: Text('Continue Shopping'),
        ),
      ),
    );
  }
}
