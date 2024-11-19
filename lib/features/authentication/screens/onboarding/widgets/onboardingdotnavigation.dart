import '../../../controller/controllers onbording/onboarding_controller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.find;
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
            effect:
                ExpandingDotsEffect(activeDotColor: dark? TColors.light : TColors.dark, dotHeight: 6),
            controller: controller.pageController,
            onDotClicked: controller.dotNavigatorClick,
            count: 3));
  }
}