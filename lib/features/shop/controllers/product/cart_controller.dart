// ignore_for_file: unused_local_variable

import 'package:bongo_mart/features/shop/controllers/product/variation_controller.dart';
import 'package:bongo_mart/features/shop/models/cart_item_model.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/enum/enums.dart';
import 'package:bongo_mart/utils/local_storage/storage_utility.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

  //Add to cart
  void addToCart(ProductModel product) {
    if (productQuantityInCart.value < 1) {
      TLoaders.customToast(message: 'Select a quantity');
      return;
    }

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      TLoaders.customToast(message: 'Select a variation');
      return;
    }

    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock == 0) {
        TLoaders.warningSnackBar(
          title: 'Out of stock!',
          message: 'Selected variation is out of stock',
        );
        return;
      }
    } else {
      if (product.stock == 0) {
        TLoaders.warningSnackBar(
          title: 'Out of stock!',
          message: 'Selected product is out of stock',
        );
        return;
      }
    }

    final selectedCartItem =
        convertProductToCartItem(product, productQuantityInCart.value);
    int index = cartItems.indexWhere(
      (element) =>
          element.productid == selectedCartItem.productid &&
          element.variationid == selectedCartItem.variationid,
    );
    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();
    TLoaders.customToast(message: 'Added to cart');
  }

  void addOneItemToCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere((element) =>
        element.productid == cartItem.productid &&
        element.variationid == cartItem.variationid);
    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(cartItem);
    }
    updateCart();
  }

  void removeOneItemFromCart(CartItemModel cartItem) {
    int index = cartItems.indexWhere((element) =>
        element.productid == cartItem.productid &&
        element.variationid == cartItem.variationid);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Item',
      middleText: 'Are you sure you want to remove this item from cart?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        TLoaders.customToast(message: 'Removed from cart');
        Get.back();
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  //Product Model to Cart Item Model
  CartItemModel convertProductToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;

    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
      productid: product.id,
      quantity: quantity,
      price: price,
      title: product.title,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  //Update Cart
  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  //Update Cart Total
  void updateCartTotal() {
    double calculatedTotalPrice = 0.0;
    int calculatedTotalItems = 0;

    for (var item in cartItems) {
      calculatedTotalPrice += item.price * item.quantity.toDouble();
      calculatedTotalItems += item.quantity;
    }

    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedTotalItems;
  }

  //Save Cart Items
  void saveCartItems() {
    final cartItemsString = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData('cartItems', cartItemsString);
  }

  //Load Cart Items
  void loadCartItems() {
    final cartItemsString =
        TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemsString != null) {
      cartItems.assignAll(cartItemsString
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  //Get Product Quantity In Cart
  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((element) => element.productid == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  //Validate Product Quantity In Cart
  int validateProductQuantity(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (element) =>
          element.productid == productId && element.variationid == variationId,
      orElse: () => CartItemModel.empty(),
    );

    return foundItem.quantity;
  }

  //Clear Cart
  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
