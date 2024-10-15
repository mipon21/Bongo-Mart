import 'package:bongo_mart/features/authentication/controllers%20onbording/onboarding_controller.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TSizes.defaultSpace+10,
      child: ElevatedButton(
        onPressed: (){
          OnBoardingController.find.nextPage();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder()
        ),
         child: const Icon(Icons.arrow_forward_ios_outlined,)
         )
    );
  }
}