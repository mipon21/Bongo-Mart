// ignore_for_file: empty_catches, unused_local_variable, avoid_print

import 'package:bongo_mart/data/repositories/authentication/auth_repo.dart';
import 'package:bongo_mart/features/personalization/controller/user_controller.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/helpers/network_manager.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  // TextEditingController

  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final userController = Get.put(UserController());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (localStorage.read('REMEMBER_ME_EMAIL') != null &&
        localStorage.read('REMEMBER_ME_PASSWORD') != null) {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
      rememberMe.value = true;
    }
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog("Logging You In...", TImages.successfullyRegistrationAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'Oh Snap!', message: 'No internet connection');
        return;
      }
      //Validations
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Remember Me
      if (rememberMe.value == true) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        localStorage.remove('REMEMBER_ME_EMAIL');
        localStorage.remove('REMEMBER_ME_PASSWORD');
      }

      final userCredential =
          await AuthenticationRepository.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //Google Sign In
  Future<void> signInWithGoogle() async {
    try {
      TFullScreenLoader.openLoadingDialog("Signing You In...", TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Google Sign In
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();
      //save user data
      await userController.saveUserRecords(userCredential);
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
