import 'package:bongo_mart/common/widgets/layout/grid_layout.dart';
import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyVerticalProductShimmer extends StatelessWidget {
  const MyVerticalProductShimmer({super.key, required this.itemCount});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return MyGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            MyShimmerEffect(width: 180, height: 180,),
            SizedBox(height: TSizes.spaceBtwItems),
            //Text
            MyShimmerEffect(width: 160, height: 15,),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            //Price
            MyShimmerEffect(width: 110, height: 15,),
          ],
        ),
      ),
    );
  }
}
