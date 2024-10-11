import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bongo_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return AnimatedSplashScreen(
      splashIconSize: double.infinity,
      duration: 3000, // Duration for the splash screen (in milliseconds)
      splashTransition: SplashTransition
          .scaleTransition, // Use scale transition for a smoother effect
      splash: isDark
          ? Lottie.asset("assets/animation/bongo-mart-logo-dark.json")
          : Lottie.asset("assets/animation/bongo-mart-logo-light.json"),
      nextScreen: const OnBoarding(),
      backgroundColor: isDark ? const Color(0xFF1D4164) : Colors.white, // Set the background color
    );
  }
}
