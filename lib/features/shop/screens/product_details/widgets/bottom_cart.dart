// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:bongo_mart/common/widgets/icons/brand_title_with_verified_icon.dart';
import 'package:bongo_mart/common/widgets/images/my_circular_Image.dart';
import 'package:bongo_mart/features/shop/controllers/product/cart_controller.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomAddToCart extends StatelessWidget {
  const MyBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 16, vertical: TSizes.defaultSpace / 4),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),    
      decoration: BoxDecoration(
        color: isDark ? Colors.transparent : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     MyCircularFavoriteIcon(
          //       height: 40,
          //       width: 40,
          //       icon: Iconsax.minus,
          //       color: TColors.white,
          //       backgroundColor: isDark
          //           ? TColors.secondary.withOpacity(0.8)
          //           : TColors.secondary.withOpacity(0.8),
          //     ),
          //     SizedBox(
          //       width: TSizes.spaceBtwItems,
          //     ),
          //     Text(
          //       '2',
          //       style: Theme.of(context).textTheme.titleMedium,
          //     ),
          //     SizedBox(
          //       width: TSizes.spaceBtwItems,
          //     ),
          //     MyCircularFavoriteIcon(
          //       height: 40,
          //       width: 40,
          //       icon: Iconsax.add,
          //       color: TColors.white,
          //       backgroundColor: isDark
          //           ? TColors.secondary.withOpacity(0.8)
          //           : TColors.secondary.withOpacity(0.8),
          //     ),
          //   ],
          // ),
          Row(
            children: [
              MyCircularImage(
                isDark: isDark,
                overlayColor: isDark ? TColors.white : TColors.black,
                imageUrl: TImages.nikeLogo,
                backgroundColor: Colors.transparent,
                width: 32,
                height: 32,
              ),
              MyBrandTitleWithVerifiedIcon(
                title: 'Nike',
                brandTitleSize: TextSizes.medium,
              ),
            ],
          ),

          // Row(
          //   children: [
          //     MyCircularFavoriteIcon(icon: Icons.chat, height: 40, width: 40,),
          //   ],
          // ),
          SizedBox(
            width: TSizes.spaceBtwItems / 2,
          ),

          Expanded(
            child: ElevatedButton(
              onPressed: () {
                final cartItem = cartController.convertProductToCartItem(product, 1);
                cartController.addOneItemToCart(cartItem);
                TLoaders.customToast(message: 'Added to cart');
              },
              child: Text(
                'Add to cart',
                style: Theme.of(context).textTheme.labelSmall!.apply(
                      overflow: TextOverflow.ellipsis,
                      color: TColors.light,
                    ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.secondary,
                padding: EdgeInsets.all(TSizes.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                ),
              ),
            ),
          ),
          SizedBox(
            width: TSizes.spaceBtwItems / 2,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Buy Now',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(overflow: TextOverflow.ellipsis, color: TColors.light),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? TColors.primary : TColors.primary,
                padding: EdgeInsets.all(TSizes.md),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: TColors.primary),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
