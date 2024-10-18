
import 'package:bongo_mart/features/personalization/screens/settings/settings.dart';
import 'package:bongo_mart/features/shop/screens/cart/cart_screen.dart';
import 'package:bongo_mart/features/shop/screens/favourite/favourite_screen.dart';
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
    final controller = Get.put(NavigationController());
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller._selectedIndex.value,
          onTap: (int index) {
            controller._selectedIndex.value = index;
          },
          backgroundColor: isDark ? TColors.dark : TColors.white,
          selectedItemColor: isDark ? TColors.secondary : TColors.primary, // Adjust as necessary
          unselectedItemColor: isDark ? Colors.white70 : Colors.black54,
          items: [
            _buildBottomNavigationBarItem(Iconsax.home, "Home"),
            _buildBottomNavigationBarItem(Iconsax.shop, "Store"),
            _buildBottomNavigationBarItem(Iconsax.shopping_cart, "Cart"),
            _buildBottomNavigationBarItem(Iconsax.heart, "Favourite"),
            _buildBottomNavigationBarItem(Iconsax.user, "Profile"),
          ],
        ),
      ),
      body: Obx(() => controller.screenList[controller._selectedIndex.value]),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: _buildAnimatedIcon(icon),
      label: _buildEllipsizedLabel(label),
    );
  }

  Widget _buildAnimatedIcon(IconData icon) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300), // Adjust the duration as necessary
      transitionBuilder: (Widget child, Animation<double> animation) {
        const offset = 0.1;
        final tween = Tween<Offset>(begin: const Offset(0, offset), end: Offset.zero);
        final offsetAnimation = tween.animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      child: Icon(
        icon,
        key: ValueKey<IconData>(icon), // Key to differentiate icons
      ),
    );
  }

  String _buildEllipsizedLabel(String label) {
    // Return the label string for the BottomNavigationBarItem
    return label.length > 8 ? '${label.substring(0, 8)}...' : label;
  }
}

class NavigationController extends GetxController {
  final Rx<int> _selectedIndex = 0.obs;

  final screenList = [
    const HomeScreen(),
    const StoreScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
