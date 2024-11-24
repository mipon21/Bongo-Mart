// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:bongo_mart/common/widgets/products/cart/add_remove_btn.dart';
import 'package:bongo_mart/common/widgets/products/cart/cart_item.dart';
import 'package:bongo_mart/common/widgets/text/product_price.dart';
import 'package:bongo_mart/features/shop/controllers/product/cart_controller.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MyCartItems extends StatelessWidget {
  const MyCartItems({
    super.key,
    this.showAddRemoveBtn = true,
    this.isScrollable = false,
  });
  final bool showAddRemoveBtn;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    return Obx(
      () {
        return ListView.separated(
          shrinkWrap: true,
          physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
          itemCount: controller.cartItems.length,
          separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwItems),
          itemBuilder: (_, index) => Container(
            padding: EdgeInsets.all(TSizes.sm),
            decoration: BoxDecoration(
              border: Border.all(
                  color: isDark
                      ? TColors.darkGrey
                      : TColors.primary.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(TSizes.sm),
            ),
            child: Obx(
              () {
                final item = controller.cartItems[index];
                return Column(
                  children: [
                    MyCartItem(
                      cartItem: item,
                    ),
                    if (showAddRemoveBtn) SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: showAddRemoveBtn
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.end,
                      children: [
                        if (showAddRemoveBtn)
                          Row(
                            children: [
                              SizedBox(width: 70),
                              MyProductQuantityWithAddRemoveBtn(
                                quantity: item.quantity,
                                add: () => controller.addOneItemToCart(item),
                                remove: () => controller.removeOneItemFromCart(item),
                              ),
                            ],
                          ),
                        //Add and Remove Quantity

                        MyProductPrice(price: (item.price*item.quantity).toStringAsFixed(0))
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
