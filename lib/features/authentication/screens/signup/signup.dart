// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/widgets_login_signup/myformdevider.dart';
import 'package:bongo_mart/common/widgets/widgets_login_signup/mysocialbuttons.dart';
import 'package:bongo_mart/features/authentication/screens/signup/widgets/allready_have_account.dart';
import 'package:bongo_mart/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios_new_rounded, color: isDark ? TColors.white : TColors.black,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: TSizes.spaceBtwSections,),
              SignUpForm(), 
              SizedBox(height: TSizes.spaceBtwSections,),
              MyFormDevider(title: TTexts.orSignUpWith.capitalize!, isDark: isDark,),
              SizedBox(height: TSizes.spaceBtwSections,),
              MySocialButtons(),
              SizedBox(height: TSizes.spaceBtwSections,),
              AllreadyHaveAccount(isDark: isDark),
            ],
          ),
        ),
      )
    );
  }
}

