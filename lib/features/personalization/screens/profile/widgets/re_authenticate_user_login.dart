// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/features/personalization/controller/user_controller.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('Re-authenticate Your Account'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Text(
                'User Phone Number for easy identification. This phone number will be on our records and will be displayed on your profile.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              Form(
        key: controller.reAuthFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.verifyEmail,
              validator: (value) => TValidator.validateEmail(value),
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                controller: controller.verifyPassword,
                validator: (value) =>
                    TValidator.validateEmptyTextField(value, "Password"),
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: controller.hidePassword.value
                        ? Icon(Iconsax.eye_slash)
                        : Icon(Iconsax.eye),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.reAuthenticateEmailAndPassword(),
                child: Text("Verify"),
              ),
            ),
          ],
        ),
      ),
            ],
          ),
        ),
      ),
    );
  }
}
