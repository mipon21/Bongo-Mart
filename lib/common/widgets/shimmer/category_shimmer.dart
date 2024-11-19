// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyCategoryShimmer extends StatelessWidget {
  const MyCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return Column(
            children: [
              MyShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems/2),
              MyShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
