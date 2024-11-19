// ignore_for_file: unused_field, prefer_const_constructors, unused_local_variable

import 'package:bongo_mart/data/repositories/categories/fireabse_storage_service.dart';
import 'package:bongo_mart/features/shop/models/banner_model.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/firebase_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/format_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/platform_exceptions.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
  // Firebase Firestore instance & variables
  final _db = FirebaseFirestore.instance;
  
  //Get all categories
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();

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
  //Get sub categories

  //upload Category to storage

  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // Upload all the Categories along with their Images
      final storage = Get.put(MyFirebaseStorageService());
      // Loop through each category
      for (var banner in banners) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);
        // Upload Image and Get its URL
        final url =
            await storage.uploadImageData('Banners', file, banner.name);
        // Assign URL to Category.image attribute
        banner.imageUrl = url;
        // Store Category in Firestore
        await _db
            .collection("Banners")
            .doc(banner.name)
            .set(banner.toJson());
      }
      TLoaders.successSnackBar(title: 'Success', message: 'Banners Uploaded Successfully');
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
