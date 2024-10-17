
// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class MyRatingBarIndicatorUni extends StatelessWidget {
  const MyRatingBarIndicatorUni({
    super.key, required this.rating, this.itemSize = 10,
  });
  final double rating;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: itemSize,
      unratedColor: TColors.grey,
      itemBuilder: (_, __) => Icon(
        Iconsax.star5,
        color: TColors.primary,
      ),
    );
  }
}