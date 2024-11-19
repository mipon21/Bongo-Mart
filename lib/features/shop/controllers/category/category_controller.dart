// ignore_for_file: unused_field

import 'package:bongo_mart/data/repositories/categories/categoy_repository.dart';
import 'package:bongo_mart/features/shop/models/category_model.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
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

  // Get Category or Sub Category Products
}
