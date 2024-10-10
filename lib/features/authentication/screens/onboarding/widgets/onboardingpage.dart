
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });
  final image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperFunctions.screenWidth()*0.8,
            height: THelperFunctions.screenHeight()*0.55,
            image: AssetImage(image)
            ),
            Text(title, style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: TSizes.spaceBtwItems,),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}