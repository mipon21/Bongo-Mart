// ignore_for_file: empty_catches

import 'package:bongo_mart/data/repositories/authentication/auth_repo.dart';
import 'package:bongo_mart/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/helpers/network_manager.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();
  final email = TextEditingController();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog("Sending Password Reset Email...", TImages.processingAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!forgotPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Success', message: 'Password Reset Email Sent');

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));



    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog("Sending Password Reset Email...", TImages.processingAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Check Your Email For Password Reset Link');



    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
