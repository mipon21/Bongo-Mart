import 'package:bongo_mart/data/repositories/banner/banner_repository.dart';
import 'package:bongo_mart/features/shop/models/banner_model.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updateCarouselIndex(int index) {
    carousalCurrentIndex.value = index;
  }

fetchBanners() async {
    try {
      isLoading.value = true;
      final fetchedBanners = await _bannerRepository.fetchBanners();
      banners.assignAll(fetchedBanners); // Updates the banners list directly
    } catch (e) {
      TLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
