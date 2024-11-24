// ignore_for_file: unused_field

import 'package:bongo_mart/data/repositories/categories/categoy_repository.dart';
import 'package:bongo_mart/data/repositories/product/product_repository.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      // Fetch all categories from data source (Firestore, Api, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the list of categories
      allCategories.assignAll(categories);

      //Filter categories by featured
      featuredCategories.assignAll(categories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.warningSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Load all categories

  // Load Selected Category

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
       final subCategories = await _categoryRepository.getSubCategories(categoryId);
       return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  // Get Category or Sub Category Products

  Future<List<ProductModel>> getCategoryProducts(String categoryId, {int limit = 4}) async {
    try {
      final products =
          await ProductRepository.instance.getProductForCategory(categoryId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }
}
