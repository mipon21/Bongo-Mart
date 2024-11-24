// ignore_for_file: avoid_print, unused_local_variable, unrelated_type_equality_checks, unnecessary_string_escapes, unnecessary_null_comparison

import 'package:bongo_mart/data/repositories/product/product_repository.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/enum/enums.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  List<ProductModel> get products => featuredProducts;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  // Get limited featured products
  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepository.getFeaturedProducts();

      featuredProducts.assignAll(products);

    } catch (e) {
      TLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Get all featured products
  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {

      final products = await productRepository.getAllFeaturedProducts();

      return products;

      
    } catch (e) {
      TLoaders.errorSnackBar(title: "Error", message: e.toString());
      return [];
    } 
  }
  // Get all products
  Future<List<ProductModel>> fetchAllProducts() async {
    try {

      final products = await productRepository.getAllProducts();

      return products;

      
    } catch (e) {
      TLoaders.errorSnackBar(title: "Error", message: e.toString());
      return [];
    } 
  }

  //--Get Product Price--//
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //if no variation exist
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toStringAsFixed(0);
    } else {
      for (var variation in product.productVariations!) {
        double pricetoConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (pricetoConsider < smallestPrice) {
          smallestPrice = pricetoConsider;
        }
        if (pricetoConsider > largestPrice) {
          largestPrice = pricetoConsider;
        }
      }
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toStringAsFixed(0);
      } else {
        return "${smallestPrice.toStringAsFixed(0)} - \৳${largestPrice.toStringAsFixed(0)}";
      }
    }
  }

 String getLargestProductPrice(ProductModel product) {
  double largestPrice = 0.0;

  // If no variations exist, return the product's price or sale price
  if (product.productType == ProductType.single.toString()) {
    return (product.salePrice > 0 ? product.salePrice : product.price)
        .toStringAsFixed(0);
  } else {
    // Loop through variations to find the largest price
    for (var variation in product.productVariations!) {
      double variationPrice = variation.salePrice > 0 ? variation.price : variation.salePrice;

      // Update largestPrice if the current variationPrice is greater
      if (variationPrice > largestPrice) {
        largestPrice = variationPrice;
      }
    }

    // Return the largest price found
    return "৳${largestPrice.toStringAsFixed(0)}";
  }
}


  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice == 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    if (stock > 10) {
      return "In Stock";
    } else if (stock > 0 && stock <= 10) {
      return "Low Stock";
    } else if (stock == 0) {
      return "Out of Stock";
    } else if (stock < 0) {
      return "Coming Soon";
    }
    return "In Stock";
  }
}
