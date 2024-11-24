import 'package:bongo_mart/features/shop/controllers/product/cart_controller.dart';
import 'package:bongo_mart/features/shop/controllers/product/variation_controller.dart';

import '../utils/helpers/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
