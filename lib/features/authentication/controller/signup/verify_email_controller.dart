// ignore_for_file: unnecessary_overrides, prefer_const_constructors

import 'dart:async';

import 'package:bongo_mart/common/widgets/widgets_login_signup/success_screen/success_screen.dart';
import 'package:bongo_mart/data/repositories/authentication/auth_repo.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  //Send Ecail whenever Verify Screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //Send Email Verification link

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Success',
          message: 'Verification link sent successfully check your email');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Auto Redirect to Login after timer ends
  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            buttonText: "Login",
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
        
      }
    });
  }

  //Manually Check Email Verification link
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.off(
          () => SuccessScreen(
            image: TImages.successfulPaymentIcon,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            buttonText: "Login",
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
  }
}
