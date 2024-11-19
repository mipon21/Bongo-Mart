// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
        leadingIcon: Icons.arrow_back_ios_new,
        leadingOnPressed: () => Get.back(),
        title: Text(
          "Add New Address",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: 'Name',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  hintText: 'Enter your name',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'Phone Number',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  hintText: 'Enter your phone number',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: 'Street',
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwInputFields),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.code5),
                        labelText: 'Postal Code',
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.building),
                        labelText: 'City',
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  SizedBox(width: TSizes.spaceBtwInputFields),
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.activity),
                        labelText: 'State',
                        labelStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.global),
                  labelText: 'Country',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  hintText: 'Enter your country',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: TSizes.defaultSpace),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDark ? TColors.secondary : TColors.primary,
                  ),
                  child: Text('Add Address'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
