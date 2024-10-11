// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/widgets_login_signup/myformdevider.dart';
import 'package:bongo_mart/features/authentication/screens/login/widgets/myloginform.dart';
import 'package:bongo_mart/features/authentication/screens/login/widgets/myloginheader.dart';
import 'package:bongo_mart/common/widgets/widgets_login_signup/mysocialbuttons.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: TSizes.appBarHeight,
              left: TSizes.defaultSpace,
              right: TSizes.defaultSpace,
              bottom: TSizes.defaultSpace),
          child: Column(
            children: [
              MyLoginHeader(isDark: isDark),
              MyLoginForm(),
              //Divider
              MyFormDevider(isDark: isDark, title: TTexts.orSignInWith.capitalize!),
              SizedBox(height: TSizes.spaceBtwItems,),
              MySocialButtons()  
            ],
          ),
        ),
      ),
    );
  }
}








