// ignore_for_file: empty_catches, unused_local_variable

import 'package:bongo_mart/data/repositories/authentication/auth_repo.dart';
import 'package:bongo_mart/data/repositories/user/user_repo.dart';
import 'package:bongo_mart/features/authentication/models/user_model.dart';
import 'package:bongo_mart/features/authentication/screens/signup/vertify_email.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/helpers/network_manager.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  //SignUp
  //Validations
  final hidePassword = true.obs;
  final privacyChecked = true.obs;
  final isLoading = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  final gender = ''.obs;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  void signup() async {
  try {
    // Start loading
    TFullScreenLoader.openLoadingDialog("We are processing your request...", TImages.successfullyRegistrationAnimation);
    
    // Check Internet Connection
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: 'Oh Snap!', message: 'No internet connection');
      return;
    }

    // Form Validation
    if (!signUpFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // Check if gender is selected
    if (gender.value.isEmpty) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(
          title: 'Oh Snap!',
          message: 'Please select a gender');
      return;
    }

    // Privacy Policy and Terms of Service
    if (!privacyChecked.value) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(
          title: 'Oh Snap!',
          message: 'Please accept the terms and conditions');
      return;
    }

    // Register User & Save to Database
    final userCredential =
        await AuthenticationRepository.instance.signUpWithEmailAndPassword(
      email.text.trim(),
      password.text.trim(),
    );

    // Save User Data to Firestore
    final newUser = UserModel(
      id: userCredential.user!.uid,
      username: username.text.trim(),
      email: email.text.trim(),
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      gender: gender.value,
      dateOfBirth: '',
      profilePicture: '',
    );

    final userRepository = Get.put(UserRepository());
    userRepository.saveUserRecordEmailPassword(newUser);

    // Show success message
    TFullScreenLoader.stopLoading();
    TLoaders.successSnackBar(
        title: 'Success', message: 'User registered successfully');
    Get.to(() => VertifyEmailScreen(email: email.text.trim()));

  } catch (e) {
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}

}
