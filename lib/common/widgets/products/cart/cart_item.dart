// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:bongo_mart/common/widgets/icons/brand_title_with_verified_icon.dart';
import 'package:bongo_mart/common/widgets/images/my_rounded_image.dart';
import 'package:bongo_mart/common/widgets/text/product_title.dart';
import 'package:bongo_mart/features/shop/models/cart_item_model.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyCartItem extends StatelessWidget {
  const MyCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        MyRoundedImage(
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor:
              isDark ? TColors.secondary.withOpacity(0.5) : TColors.light,
        ),
        SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                  child: MyProductTitle(title: cartItem.title, maxLines: 1)),

              //Atributes

              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(children: [
                          TextSpan(
                            text: '${e.key}: ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: '${e.value}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          TextSpan(
                            text:
                                '  ', // Adds space between each key-value pair
                          ),
                        ]),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
