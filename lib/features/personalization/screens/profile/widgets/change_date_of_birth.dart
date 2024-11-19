// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/personalization/screens/profile/controller/update_single_field_controller.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class ChangeDateOfBirthScreen extends StatelessWidget {
  const ChangeDateOfBirthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateSingleFieldController());
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Change Date of Birth'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'User Date of Birth for easy identification. This date of birth will be on our records and will be displayed on your profile.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Form(
              key: controller.updateDateOfBirthFormKey,
              child: Obx(() => TextFormField(
                    controller: controller.dateOfBirth.value,
                    validator: (value) => TValidator.validateEmptyTextField(
                        value, "Date of Birth"),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.calendar_1),
                      labelText: "Date of Birth",
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        controller.dateOfBirth.value.text =
                            DateFormat('dd MMM yyyy').format(pickedDate);
                      }
                    },
                  )),
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateDateOfBirth(),
                child: Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
