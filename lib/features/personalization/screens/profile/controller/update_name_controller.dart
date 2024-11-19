// ignore_for_file: empty_catches, prefer_const_constructors

import 'package:bongo_mart/data/repositories/user/user_repo.dart';
import 'package:bongo_mart/features/personalization/controller/user_controller.dart';
import 'package:bongo_mart/features/personalization/screens/profile/profile.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/helpers/network_manager.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = Get.put(UserController(), permanent: true);
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateFullNameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> updateUsernameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
    userController.user.refresh();
  }

  Future<void> updateFullName() async {
    try {
      TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!updateFullNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);
      //update Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      userController.user.refresh();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Congratulations!", message: "Name updated successfully");
      Get.to(() => ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Failed to update name");
    }
  }
}
