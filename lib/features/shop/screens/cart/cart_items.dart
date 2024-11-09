// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:bongo_mart/common/widgets/products/cart/add_remove_btn.dart';
import 'package:bongo_mart/common/widgets/products/cart/cart_item.dart';
import 'package:bongo_mart/common/widgets/text/product_price.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

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
    return ListView.separated(
      shrinkWrap: true,
      physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
      itemCount: 30,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) => Container(
        padding: EdgeInsets.all(TSizes.sm),
        decoration: BoxDecoration(
          border: Border.all(color: isDark ? TColors.darkGrey : TColors.primary.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(TSizes.sm),
        ),
        child: Column(
          children: [
            MyCartItem(),
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
                    MyProductQuantityWithAddRemoveBtn(),
                  ],
                ),
                //Add and Remove Quantity
        
                MyProductPrice(price: '1000')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
