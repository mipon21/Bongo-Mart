// ignore_for_file: avoid_print, unused_local_variable, unrelated_type_equality_checks, unnecessary_string_escapes, unnecessary_null_comparison
import 'package:bongo_mart/data/repositories/product/product_repository.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllProductController extends GetxController {
  static AllProductController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try {
      if (query == null) {
        return [];
      }

      final products = await repository.fetchProductByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Error", message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value == sortOption;
    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Higher Price':
        products.sort((a, b) => b.salePrice.compareTo(a.salePrice));
        break;
      case 'Lower Price':
        products.sort((a, b) => a.salePrice.compareTo(b.salePrice));
        break;
      case 'Newest':
        products.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        break;
      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.price.compareTo(a.price);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Name');
  }













}
