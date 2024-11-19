// ignore_for_file: prefer_const_constructors, unused_field, slash_for_doc_comments, unused_local_variable

import 'dart:io';

import 'package:bongo_mart/data/repositories/authentication/auth_repo.dart';
import 'package:bongo_mart/features/authentication/models/user_model.dart';
import 'package:bongo_mart/utils/exceptions/firebase_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/format_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  //save user record for Google Sign In
  Future<void> saveUserRecord(UserModel user) async {
    try {
      return await db
          .collection('Users')
          .doc(user.id)
          .set(user.toJson(), SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

  //save user record for Email and Password Sign In
  Future<void> saveUserRecordEmailPassword(UserModel user) async {
    try {
      return await db
          .collection('Users')
          .doc(user.id)
          .set(user.toJsonEmailPassword(), SetOptions(merge: true));
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

  //fetch user record based on id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

  //update user record
  Future<void> updateUserRecord(UserModel updatedUser) async {
    try {
      return await db
          .collection('Users')
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

  //update single field of user record
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      return await db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

  //remove user record
  Future<void> removeUserRecord(String userId) async {
    try {
      return await db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong! Please try again.';
    }
  }

  /// Uploads a user profile image to Firebase Storage and returns the download URL.
  Future<String> uploadImage(String path, XFile image) async {
    try {
      // Reference to Firebase Storage location
      final ref = FirebaseStorage.instance.ref(path).child(image.name);

      // Upload the image file to Firebase Storage
      await ref.putFile(File(image.path));

      // Retrieve and return the download URL after successful upload
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      // Firebase-specific exceptions
      throw TFirebaseException(e.code).message;
    } on FormatException {
      // Handle invalid data or URI format exceptions
      throw TFormatException();
    } on PlatformException catch (e) {
      // Handle platform-specific exceptions
      throw TPlatformException(e.code).message;
    } catch (e) {
      // Catch any other unexpected exceptions
      throw 'Something went wrong! Please try again.';
    }
  }
}
