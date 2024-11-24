// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/personalization/controller/address_controller.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:bongo_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
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
          key: controller.addressFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.name,
                validator: (value) => TValidator.validateEmptyTextField(
                  value,
                  'Name',
                ),
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
                controller: controller.phoneNumber,
                validator: TValidator.validatePhoneNumber,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.mobile),
                  labelText: 'Phone Number',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  hintText: 'Enter your phone number',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.street,
                validator: (value) => TValidator.validateEmptyTextField(
                  value,
                  'Area and House No',
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.building_31),
                  labelText: 'Area and House No',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      controller: controller.city,
                      validator: (value) => TValidator.validateEmptyTextField(
                        value,
                        'City',
                      ),
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
                      controller: controller.postalCode,
                      validator: (value) => TValidator.validateEmptyTextField(
                        value,
                        'Postal Code',
                      ),
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
              TextFormField(
                controller: controller.country,
                validator: (value) => TValidator.validateEmptyTextField(
                  value,
                  'Country',
                ),
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
                  onPressed: () => controller.addNewAddress(),
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
