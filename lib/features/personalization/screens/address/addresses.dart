// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/features/personalization/controller/address_controller.dart';
import 'package:bongo_mart/features/personalization/screens/address/add_new_address.dart';
import 'package:bongo_mart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/cloud_helper_functions.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressesScreen extends StatelessWidget {
  const UserAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(AddressController());
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
        leadingOnPressed: () {
          NavigationController.instance.selectedIndex.value = 4;
          Get.to(() => NavigationMenu());
        },
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(() {
            return FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.allUserAddresses(),
                builder: (context, snapshot) {



                  const loader = Column(
                    children: [
                      MyShimmerEffect(
                        height: 150,
                        width: double.infinity,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),
                      MyShimmerEffect(
                        height: 150,
                        width: double.infinity,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),
                      MyShimmerEffect(
                        height: 150,
                        width: double.infinity,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),
                      MyShimmerEffect(
                        height: 150,
                        width: double.infinity,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),
                      MyShimmerEffect(
                        height: 150,
                        width: double.infinity,
                      ),
                      
                    ],
                  );

                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);

                  if (widget != null) return widget;

                  final addresses = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (context, index) {
                      return MySingleAddress(
                        onTap: () => controller.selectAddress(addresses[index]),
                        onPressed: () => controller.deleteAddressWarning(addresses[index].id),
                        address: addresses[index],
                      );
                    },
                  );
                });
          }),
        ),
      ),
    );
  }
}
