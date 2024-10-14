// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/features/shop/screens/home/home_screen.dart';
import 'package:bongo_mart/features/shop/screens/store/store.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(NavigationController());
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0.0,
          backgroundColor: isDark ? TColors.dark : TColors.white,
          indicatorColor: isDark ? TColors.primary.withOpacity(0.1) : TColors.primary.withOpacity(0.1),
          selectedIndex: controller._selectedIndex.value,
          onDestinationSelected: (int index){
            controller._selectedIndex.value = index;
          },
          
          destinations: [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
          NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
          NavigationDestination(icon: Icon(Iconsax.shopping_cart), label: "Cart"),
          NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
          NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
        ]),
      ),
      body: Obx(() => controller.screenList[controller._selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int> _selectedIndex = 0.obs;

  final screenList = [
    HomeScreen(),
    StoreScreen(),
    Container(color: Colors.blue,),
    Container(color: Colors.yellow,),
    Container(color: Colors.purple,),
  ];

}