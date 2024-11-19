// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:bongo_mart/common/custom_dialog/customdialog.dart';
import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:bongo_mart/common/widgets/list_tile/user_profile_tile.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/data/repositories/authentication/auth_repo.dart';
import 'package:bongo_mart/features/personalization/controller/theme_controller.dart';
import 'package:bongo_mart/features/personalization/controller/user_controller.dart';
import 'package:bongo_mart/features/personalization/screens/address/addresses.dart';
import 'package:bongo_mart/features/personalization/screens/settings/widgets/load_data/load_data.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:bongo_mart/features/shop/screens/order/order.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NavigationController navigationController = Get.put(NavigationController());
    final controller = UserController.instance;
    final isDark = THelperFunctions.isDarkMode(context);
    final themeController = Get.put(ThemeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-------------Header-------------//
            MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  MyAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  //-------------Profile Setup-------------//

                  MyUserProfile(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            //-------------Body-------------//
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //-----Account Settings-----//
                  MySectionHeading(title: 'Account Settings'),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  MySettingsMenuTile(
                    onTap: () => Get.to(() => const UserAddressesScreen()),
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Address',
                  ),
                  MySettingsMenuTile(
                    onTap: () => navigationController.selectedIndex.value = 2,
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add or remove products and move to checkout',
                  ),
                  MySettingsMenuTile(
                    onTap: () => Get.to(() => const OrderScreen()),
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'View Your Order History',
                  ),
                  MySettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.bank,
                    title: 'My Payment',
                    subtitle: 'Manage Your Payment Methods',
                  ),
                  MySettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subtitle: 'Manage Your Coupons',
                  ),
                  MySettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Manage Your Notifications',
                  ),
                  MySettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.security_card,
                    title: 'Privacy and Security',
                    subtitle: 'Manage Your Privacy and Security',
                  ),
                  //-----App Settings-----//
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  MySectionHeading(title: 'App Settings'),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  MySettingsMenuTile(
                    onTap: () => Get.to(() => const LoadDataScreen()),
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload Data to Cloud Firebase',
                  ),
                  MySettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.moon,
                    title: 'Dark Mode',
                    subtitle: 'Enable Dark Mode',
                    trailing: Switch(
                      value: themeController.isDark.value,
                      onChanged: (value) {
                        themeController.toggleTheme();
                      },
                    ),
                  ),
                  MySettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set Recommendation Products Location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  MySettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Enable Safe Mode',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  MySettingsMenuTile(
                    onTap: () {},
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subtitle: 'Set HD Image Quality',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),

                  //-----Logout Settings-----//
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  MySectionHeading(title: 'Logout Settings'),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () => controller.logOutWarning(),
                        child: Text('Logout')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
