// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/personalization/screens/profile/controller/update_name_controller.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: MyAppBar(title: Text('Change Name'), showBackArrow: true,),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'User Real Name for easy identification. This name will be on our records and will be displayed on your profile.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Form(
              key: controller.updateFullNameFormKey,
                child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyTextField(value, "First Name"),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.firstName,
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyTextField(value, "Last Name"),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.lastName,
                  ),
                ),
              ],
            )),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateFullName(),
                child: Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
