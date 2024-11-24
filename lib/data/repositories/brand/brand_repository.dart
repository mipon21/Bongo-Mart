// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/data/repositories/categories/fireabse_storage_service.dart';
import 'package:bongo_mart/features/shop/models/brand_model.dart';
import 'package:bongo_mart/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/firebase_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/format_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/platform_exceptions.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      return snapshot.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      QuerySnapshot querySnapshot = await _db
          .collection('BrandCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();

      List<String> brandIds =
          querySnapshot.docs.map((doc) => doc['BrandId'] as String).toList();

      if (brandIds.isEmpty) {
        return []; // Return an empty list if no brands are found
      }

      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      // Upload all the Categories along with their Images
      final storage = Get.put(MyFirebaseStorageService());
      // Loop through each category
      for (var brand in brands) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(brand.image);
        // Upload Image and Get its URL
        final url = await storage.uploadImageData('Brands', file, brand.name);
        // Assign URL to Category.image attribute
        brand.image = url;
        // Store Category in Firestore
        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
      }
      TLoaders.successSnackBar(
          title: 'Success', message: 'Brands Uploaded Successfully');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
