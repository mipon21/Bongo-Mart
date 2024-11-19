
// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class MyRatingBarIndicatorUni extends StatelessWidget {
  const MyRatingBarIndicatorUni({
    super.key, required this.rating, this.itemSize = 10, this.itemCount = 5,
  });
  final double rating;
  final double itemSize;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: itemSize,
      itemCount: itemCount ?? 5,
      unratedColor: TColors.grey,
      itemBuilder: (_, __) => Icon(
        Iconsax.star5,
        color: TColors.primary,
      ),
    );
  }
}