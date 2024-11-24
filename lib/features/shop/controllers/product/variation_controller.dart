// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, unnecessary_this, duplicate_ignore, unused_element

import 'package:bongo_mart/features/shop/controllers/product/image_controller.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  //variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;



  //--Select attribute, and Variation
  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    //--when attribute is selected we will fist add it to selected attributes
    final selectedAttributes =
        Map<String, String>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
      (variation) =>
          _isAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    if (selectedVariation.image.isNotEmpty) {
      ProductImageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }

    this.selectedVariation.value = selectedVariation;

    getProductVariationStockStatus();
  }

  // Initialize default selection with first value of each attribute


  bool _isAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    //--Check if the selected attributes Contains 3 attributes and current variation contains 2 then
    if (variationAttributes.length != selectedAttributes.length) {
      return false;
    }
    //--Check if any if selected attributes are different then return false
    for (final key in variationAttributes.keys) {
      //--Attributes[key] = [green, small, cotton] etc
      if (variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }
    return true;
  }

  //--Check if attribute is available in variation
  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where(
          (variation) =>
              variation.attributeValues[attributeName] != null &&
              variation.attributeValues[attributeName]!.isNotEmpty &&
              variation.stock > 0,
        )
        .map((variation) => variation.attributeValues[attributeName])
        .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return selectedVariation.value.salePrice > 0
        ? selectedVariation.value.salePrice.toStringAsFixed(0)
        : selectedVariation.value.price.toStringAsFixed(0);
  }

  //--Get variation stock status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        getProductStockStatus(selectedVariation.value.stock);
  }

  //--Reset selected attributes
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    selectedVariation.value = ProductVariationModel.empty();
    variationStockStatus.value = '';
  }

  //--Get product stock status
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
