// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/personalization/screens/address/add_new_address.dart';
import 'package:bongo_mart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: Icon(
          Iconsax.add,
          color: Colors.white,
        ),
        backgroundColor: isDark ? TColors.secondary : TColors.primary,
      ),
      appBar: MyAppBar(
        leadingIcon: Icons.arrow_back_ios_new,
        leadingOnPressed: () => Get.back(),
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              MySingleAddress(
                isSelectedAddress: false,
              ),
              MySingleAddress(
                isSelectedAddress: true,
              ),
               MySingleAddress(
                isSelectedAddress: false,
              ),
               MySingleAddress(
                isSelectedAddress: false,
              ),
               MySingleAddress(
                isSelectedAddress: false,
              ),
               MySingleAddress(
                isSelectedAddress: false,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

