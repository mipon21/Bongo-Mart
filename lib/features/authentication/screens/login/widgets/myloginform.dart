// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/custom_dialog/customdialog.dart';
import 'package:bongo_mart/features/authentication/controller/login/login_controller.dart';
import 'package:bongo_mart/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:bongo_mart/features/authentication/screens/signup/signup.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
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
                controller: controller.password,
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
              height: TSizes.spaceBtwInputFields / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => SizedBox(
                        width: 24,
                        child: Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value =
                                !controller.rememberMe.value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(TTexts.rememberMe),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showCustomCupertinoDialog(
                      context: context,
                      title: "Reset Password",
                      content: "Do you want to reset your password?",
                      confirmText: "Yes",
                      cancelText: "No",
                      onConfirm: () => Get.to(() => ForgetPasswordScreen()),
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Icon(Iconsax.info_circle, color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(TTexts.signIn),
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => SignupScreen());
                },
                child: Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
