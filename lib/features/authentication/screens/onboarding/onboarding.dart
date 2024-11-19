// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/features/authentication/controller/controllers%20onbording/onboarding_controller.dart';
import 'package:bongo_mart/features/authentication/screens/onboarding/widgets/onboardingdotnavigation.dart';
import 'package:bongo_mart/features/authentication/screens/onboarding/widgets/onboardingnextbutton.dart';
import 'package:bongo_mart/features/authentication/screens/onboarding/widgets/onboardingpage.dart';
import 'package:bongo_mart/features/authentication/screens/onboarding/widgets/onboardingskip.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/device/device_utility.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());
    
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageindicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),
          OnBoardingSkip(),
          OnBoardingDotNavigation(),
          OnBoardingNextButton()
        ],
      ),
    );
  }
}




