// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MyProductPrice extends StatelessWidget {
  const MyProductPrice({
    super.key,
    this.currencySign = '৳ ',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
    this.isSmall = false,
  });
  final String currencySign, price;
  final int? maxLines;
  final bool isLarge;
  final bool isSmall;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : isSmall
              ? Theme.of(context).textTheme.bodySmall!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null)
              : Theme.of(context).textTheme.titleLarge!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
