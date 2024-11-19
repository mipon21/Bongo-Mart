import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmerEffect extends StatelessWidget {
  const MyShimmerEffect(
      {super.key,
      this.width,
      this.height,
      this.radius = 15,
      this.color});

  final double? width, height;
  final double radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
        baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!, 
        highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? (isDark ? TColors.darkerGrey :TColors.white),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      );
  }
}
