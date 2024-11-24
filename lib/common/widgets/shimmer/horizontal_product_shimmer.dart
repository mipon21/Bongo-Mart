// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyHorizontalProductShimmer extends StatelessWidget {
  const MyHorizontalProductShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 145,
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            SizedBox(width: TSizes.spaceBtwItems),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        shrinkWrap: true,
        itemBuilder: (_, __) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Image
            MyShimmerEffect(width: 120, height: 120,),
            SizedBox(width: TSizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyShimmerEffect(width: 160, height: 15,),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                MyShimmerEffect(width: 110, height: 15,),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                MyShimmerEffect(width: 100, height: 15,),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                MyShimmerEffect(width: 140, height: 15,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
