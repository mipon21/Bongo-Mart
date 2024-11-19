
import 'package:bongo_mart/features/shop/models/product_model.dart';

import '../../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyRatingStars extends StatelessWidget {
  const MyRatingStars({
    required this.product,
    super.key,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: product.rating.toString(),
                  style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: ' (${product.ratingCount})',
                  style: Theme.of(context).textTheme.titleSmall),
            ])),
          ],
        ),
        //----- Share -----
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: TSizes.iconMd,
            ))
      ],
    );
  }
}