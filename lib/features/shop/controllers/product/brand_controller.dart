import 'package:bongo_mart/data/repositories/brand/brand_repository.dart';
import 'package:bongo_mart/data/repositories/product/product_repository.dart';
import 'package:bongo_mart/features/shop/models/brand_model.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    super.onInit();
    getFeaturedBrands();
  }

  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;
      final brands = await brandRepository.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(
          brands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //--brands by category
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands =
          await brandRepository.getBrandForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }


  Future<List<ProductModel>> getBrandProducts(String brandId, {int limit = -1}) async {
    try {
      final products =
          await ProductRepository.instance.getBrandProducts(brandId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }
}
