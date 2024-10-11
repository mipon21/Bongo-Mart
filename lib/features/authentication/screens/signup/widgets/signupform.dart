// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/features/authentication/screens/signup/vertify_email.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
                child: TextFormField(
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
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            expands: false,
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) {}),
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
                  onPressed: ()=>Get.to(()=>VertifyEmailScreen())
              )
          ),
        ],
      ),
    );
  }
}
