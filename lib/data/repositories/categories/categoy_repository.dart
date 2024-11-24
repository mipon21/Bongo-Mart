// ignore_for_file: unused_field, prefer_const_constructors

import 'package:bongo_mart/data/repositories/categories/fireabse_storage_service.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/firebase_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/format_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/platform_exceptions.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();
  // Firebase Firestore instance & variables
  final _db = FirebaseFirestore.instance;

  //Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
  
    try {
      final snapshot = await _db.collection('Categories').get();

      final list =
          snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();

      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
  //Get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
  
    try {
      final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get();

      final list =
          snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();

      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //upload Category to storage

  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the Categories along with their Images
      final storage = Get.put(MyFirebaseStorageService());
      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);
        // Upload Image and Get its URL
        final url =
            await storage.uploadImageData('Categories', file, category.name);
        // Assign URL to Category.image attribute
        category.image = url;
        // Store Category in Firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
      TLoaders.successSnackBar(title: 'Success!', message: 'Categories Uploaded Successfully');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
