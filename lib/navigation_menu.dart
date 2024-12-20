import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/personalization/screens/settings/settings.dart';
import 'features/shop/screens/cart/cart_screen.dart';
import 'features/shop/screens/favourite/favourite_screen.dart';
import 'features/shop/screens/home/home_screen.dart';
import 'features/shop/screens/store/store.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (int index) {
            controller.selectedIndex.value = index;
          },
          backgroundColor: isDark ? TColors.dark : TColors.white,
          selectedItemColor: isDark ? TColors.secondary : TColors.primary,
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
      body: Obx(() => controller.screenList[controller.selectedIndex.value]),
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
      duration: const Duration(milliseconds: 300),
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
        key: ValueKey<IconData>(icon), // Unique key for animation
      ),
    );
  }

  String _buildEllipsizedLabel(String label) {
    return label.length > 8 ? '${label.substring(0, 8)}...' : label;
  }
}

class NavigationController extends GetxController {
  static NavigationController instance = Get.find();
  final Rx<int> selectedIndex = 0.obs;

  final screenList = [
    const HomeScreen(),
    const StoreScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
