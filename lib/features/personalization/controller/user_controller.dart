// ignore_for_file: empty_catches, unused_local_variable, prefer_const_constructors, unrelated_type_equality_checks

import 'dart:io';
import 'dart:ui';
import 'dart:ui';

import 'package:bongo_mart/data/repositories/authentication/auth_repo.dart';
import 'package:bongo_mart/data/repositories/user/user_repo.dart';
import 'package:bongo_mart/features/authentication/models/user_model.dart';
import 'package:bongo_mart/features/authentication/screens/login/login.dart';
import 'package:bongo_mart/features/personalization/screens/profile/widgets/re_authenticate_user_login.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/network_manager.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image/image.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final localStorage = GetStorage();
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  // Save user records for any Registration
  final userRepository = Get.put(UserRepository());
  final profileLoading = false.obs;
  final imageLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  // Gender variable in UserController
  RxString gender = ''.obs;
  RxString dateOfBirth = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // Save user records for Google Sign In
  Future<void> saveUserRecords(UserCredential? userCredential) async {
    try {
      //Refresh user data
      await fetchUserRecord();

      //if no record found, save user record
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');
          final userdateOfBirth =
              dateOfBirth.value.isNotEmpty ? dateOfBirth.value : '';

          // Use gender from UserController or Firebase User
          String userGender = gender.value.isNotEmpty ? gender.value : '';

          // Map user data
          final user = UserModel(
            id: userCredential.user!.uid,
            username: username,
            email: userCredential.user!.email ?? '',
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            dateOfBirth: userdateOfBirth.toString(),
            gender: userGender,
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // Save user data to Firestore
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved!',
        message:
            "Something went wrong while saving your information. You can re-save your data in your Profile.",
      );
    }
  }

  //Delete account warning

  void deleteAccountWarning() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Account!',
      middleText:
          'Are you sure you want to delete your account permanently? This action cannot be undone. All your data will be wiped out from our system!.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text('Cancel'),
      ),
    );
  }

  //delete user account permanently
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog("Deleting your account...", TImages.successfullyRegistrationAnimation);
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      //Reverfy auth email
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Error!',
        message: 'Something went wrong while deleting your account.',
      );
    }
  }

  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      TFullScreenLoader.openLoadingDialog("Authenticating your account...", TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Error!',
        message: 'Something went wrong while authenticating your account.',
      );
    }
  }

  //upload user profile image
 uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (image != null) {
        imageLoading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> json = {
          'ProfilePicture': imageUrl,
        };
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
          title: 'Success!',
          message: 'Your profile picture has been updated.',
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error!',
        message: 'Something went wrong while uploading your profile picture.',
      );
    } finally {
      imageLoading.value = false;
    }
  }


  // Logout
  void logOutWarning() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Log Out!',
      middleText: 'Are you sure you want to log out?',
      confirm: ElevatedButton(
        onPressed: () async => AuthenticationRepository.instance.logout(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Yes'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text('Cancel'),
      ),
    );
  }
}
