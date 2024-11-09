import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../controllers%20onbording/onboarding_controller.dart';

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