// ignore_for_file: unused_local_variable, unused_element, prefer_const_constructors, unrelated_type_equality_checks

import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/enum/enums.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImageController extends GetxController {
  static ProductImageController get instance => Get.find();

  RxString selectedProductImage = "".obs;
  List<String> getAllProductImages(ProductModel product) {
    Set<String> images = {};

    // Add the thumbnail image first
    images.add(product.thumbnail);

    selectedProductImage.value = product.thumbnail;

    // Add other images if available for single product type
    if (product.productType == ProductType.single.toString() &&
        product.images != null) {
      images.addAll(product.images!);
    }

    // Add images from product variations if available
    if (product.productVariations != null &&
        product.productVariations!.isNotEmpty) {
      for (var variation in product.productVariations!) {
        images.add(
            variation.image); // No need to check for duplicates, Set handles it
      }
    }

    // Return the images as a list
    return images.toList();
  }

  void showEnlargeImage(String imageUrl) {
    Get.to(
      fullscreenDialog: true,
      () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: TSizes.defaultSpace * 2,
                  horizontal: TSizes.defaultSpace * 2),
              child: CachedNetworkImage(imageUrl: imageUrl),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: OutlinedButton(
                onPressed: () => Get.back(),
                child: Text("Close"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
