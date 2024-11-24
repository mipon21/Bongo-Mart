import 'package:bongo_mart/common/widgets/products/product_cards/product_card_horizontal_tst.dart';
import 'package:flutter/material.dart';
import 'package:bongo_mart/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';

class Tst extends StatelessWidget {
  const Tst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
      itemBuilder: (_, productIndex) => MyProductCardHorizontalTst(),
    ));
  }
}
