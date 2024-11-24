// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:io';

import 'package:bongo_mart/data/repositories/categories/fireabse_storage_service.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/enum/enums.dart';
import 'package:bongo_mart/utils/exceptions/firebase_exceptions.dart';
import 'package:bongo_mart/utils/exceptions/platform_exceptions.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //Get Limited features Products

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where("IsFeatured", isEqualTo: true)
          .limit(4)
          .get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  //Get All features Products

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Products")
          .where("IsFeatured", isEqualTo: true)
          .get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection("Products").get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  //Get All Products

  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((e) => ProductModel.fromQuerySnapshot(e))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getBrandProducts(String brandId,
      {int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final products =
          querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getProductForCategory(String categoryId,
      {int limit = 4}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      List<String> productIds =
          querySnapshot.docs.map((e) => e['ProductId'] as String).toList();

      if (productIds.isEmpty) {
        return []; // Return an empty list if no products are found
      }

      final products = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      List<ProductModel> productList =
          products.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }


  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final querySnapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Uploading Products ", TImages.processingAnimation);
      // Upload all the products along with their images
      final storage = Get.put(MyFirebaseStorageService());
      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);
        final brandImage =
            await storage.getImageDataFromAssets(product.brand!.image);
        // Upload image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());
        final brandUrl = await storage.uploadImageData(
            'Brands/Images', brandImage, product.brand!.image.toString());
        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;
        product.brand!.image = brandUrl;
        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);
            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);
            // Assign URL to product.thumbnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        // Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);
            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);
            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }
        // Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Success!", message: "Products Uploaded Successfully");
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }
}
