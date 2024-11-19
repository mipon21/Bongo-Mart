// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:bongo_mart/features/authentication/controller/signup/signup_controller.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:bongo_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                // First Name
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) {
                    return TValidator.validateEmptyTextField(
                        value, TTexts.firstName);
                  },
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                // Last Name
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) {
                    return TValidator.validateEmptyTextField(
                        value, TTexts.lastName);
                  },
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) {
              return TValidator.validateEmptyTextField(value, TTexts.username);
            },
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Obx(() => DropdownButtonFormField<String>(
                value: controller.gender.value.isEmpty
                    ? null
                    : controller.gender.value,
                onChanged: (value) {
                  controller.gender.value = value ?? '';
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.man),
                  hintText: 'Select Gender',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(TSizes.md),
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
              )),

          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) {
              return TValidator.validateEmail(value);
            },
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) {
              return TValidator.validatePhoneNumber(value);
            },
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) {
                return TValidator.validatePassword(value);
              },
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
            height: TSizes.spaceBtwInputFields,
          ),
          // Privacy Policy and Terms of Service
          Row(
            children: [
              Obx(
                () => SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: controller.privacyChecked.value,
                    onChanged: (value) {
                      controller.privacyChecked.value =
                          !controller.privacyChecked.value;
                    },
                  ),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                // Ensures the text can use the available space
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Set minimum and maximum font sizes for better control
                    double fontSizeSmall = (constraints.maxWidth * 0.035)
                        .clamp(12.0, 16.0); // Limits to between 12 and 16
                    double fontSizeMedium = (constraints.maxWidth * 0.04)
                        .clamp(14.0, 18.0); // Limits to between 14 and 18

                    return Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${TTexts.iAgreeTo} ',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: fontSizeSmall,
                                    ),
                          ),
                          TextSpan(
                            text: '${TTexts.privacyPolicy} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                  color:
                                      isDark ? TColors.white : TColors.primary,
                                  decoration: TextDecoration.underline,
                                )
                                .copyWith(
                                  fontSize: fontSizeMedium,
                                ),
                          ),
                          TextSpan(
                            text: '${TTexts.and} ',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: fontSizeSmall,
                                    ),
                          ),
                          TextSpan(
                            text: '${TTexts.termsOfUse} ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                  color:
                                      isDark ? TColors.white : TColors.primary,
                                  decoration: TextDecoration.underline,
                                )
                                .copyWith(
                                  fontSize: fontSizeMedium,
                                ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.visible, // Allows wrapping
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text(TTexts.createAccount),
              onPressed: () => controller.signup(),
            ),
          ),
        ],
      ),
    );
  }
}
