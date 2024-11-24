import 'dart:convert';

import 'package:bongo_mart/data/repositories/product/product_repository.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/local_storage/storage_utility.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  final favourites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initfavourites();
  }

  void initfavourites() {
    final json = TLocalStorage.instance().readData('favourites');

    if (json != null) {
      final storedfavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedfavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      savefavouritesToStorage();
      TLoaders.customToast(message: 'Product added to favourites');
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      savefavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(message: 'Product removed from favourites');
    }
  }

  void savefavouritesToStorage() {
    final encodedJson = jsonEncode(favourites);
    TLocalStorage.instance().saveData('favourites', encodedJson);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}
