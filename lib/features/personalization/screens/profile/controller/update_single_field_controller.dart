// ignore_for_file: empty_catches, prefer_const_constructors

import 'package:bongo_mart/data/repositories/user/user_repo.dart';
import 'package:bongo_mart/features/personalization/controller/user_controller.dart';
import 'package:bongo_mart/features/personalization/screens/profile/profile.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/formatters/formatter.dart';
import 'package:bongo_mart/utils/helpers/network_manager.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UpdateSingleFieldController extends GetxController {
  static UpdateSingleFieldController get instance => Get.find();

  final phoneNumber = TextEditingController();
  final dateOfBirth = TextEditingController().obs;
  final gender = ''.obs; // Changed to RxString instead of TextEditingController
  final userController = Get.put(UserController(), permanent: true);
  final localStorage = GetStorage();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updatePhoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> updateDateOfBirthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializePhoneNumber();
    initializeDateOfBirth();
    initializeGender();
    super.onInit();
  }

  Future<void> initializePhoneNumber() async {
    phoneNumber.text = TFormatter.deformatPhoneNumber(userController.user.value.phoneNumber);
    userController.user.refresh();
  }

  Future<void> initializeDateOfBirth() async {
    dateOfBirth.value.text = userController.user.value.dateOfBirth;
    userController.user.refresh();
  }

  Future<void> initializeGender() async {
    gender.value = userController.user.value.gender;
    userController.user.refresh();
  }

  Future<void> updatePhoneNumber() async {
    try {
      TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!updatePhoneFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        "PhoneNumber": TFormatter.formatPhoneNumber(phoneNumber.text),
      };
      await userRepository.updateSingleField(name);
      // Update Rx user value
      userController.user.value.phoneNumber =
          TFormatter.deformatPhoneNumber(phoneNumber.text);
      userController.user.refresh();
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Congratulations!",
          message: "Phone number updated successfully");
      Get.to(() => ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Failed to update phone number");
    }
  }

  Future<void> updateDateOfBirth() async {
    try {
      TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!updateDateOfBirthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        "DateOfBirth": dateOfBirth.value.text.trim(),
      };
      await userRepository.updateSingleField(name);
      // Update Rx user value
      userController.user.value.dateOfBirth = dateOfBirth.value.text.trim();
      userController.user.refresh();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Congratulations!",
          message: "Date of birth updated successfully");
      Get.to(() => ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Failed to update date of birth");
    }
  }

  Future<void> updateGender() async {
    try {
      TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // No need to validate here, just update the gender
      Map<String, dynamic> name = {
        "Gender": gender.value.trim(),
      };
      await userRepository.updateSingleField(name);
      // Update Rx user value
      userController.user.value.gender = gender.value.trim();
      userController.user.refresh();
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Congratulations!", message: "Gender updated successfully");
      Get.to(() => ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Failed to update gender");
    }
  }
}
