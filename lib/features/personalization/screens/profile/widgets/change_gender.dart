// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/personalization/screens/profile/controller/update_single_field_controller.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class ChangeGenderScreen extends StatelessWidget {
  const ChangeGenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateSingleFieldController());
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Change Gender'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'User Gender for easy identification. This gender will be on our records and will be displayed on your profile.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            DropdownButtonFormField<String>(
              onChanged: (value) {
                // Update the gender with the selected value
                controller.gender.value = value!;
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.man),
                hintText: controller.gender.value.isEmpty
                    ? 'Select Gender'
                    : controller.gender.value,
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(TSizes.md),
                ),
              ),
              hint: Center(
                child: Text(
                  controller.gender.value.isEmpty
                    ? 'Select Gender'
                    : controller.gender.value,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              items: ['Male', 'Female', 'Prefer not to say']
                  .map(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Call method to update gender
                  controller.updateGender();
                },
                child: Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
