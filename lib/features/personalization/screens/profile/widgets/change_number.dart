// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/personalization/screens/profile/controller/update_single_field_controller.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/formatters/formatter.dart';
import 'package:bongo_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  const ChangePhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateSingleFieldController());
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Change Phone Number'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'User Phone Number for easy identification. This phone number will be on our records and will be displayed on your profile.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Form(
              key: controller.updatePhoneFormKey,
              child: TextFormField(
                controller: controller.phoneNumber,
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    TValidator.validatePhoneNumber(value ?? 'Phone Number'),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.phoneNo,
                ),
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updatePhoneNumber(),
                child: Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
