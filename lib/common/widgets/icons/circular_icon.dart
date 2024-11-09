import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyCircularFavoriteIcon extends StatelessWidget {
  const MyCircularFavoriteIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.color,
    required this.icon,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final Color? color;
  final IconData icon;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : isDark
                ? TColors.secondary.withOpacity(0.2)
                : TColors.light.withOpacity(0.2),
      ),
      child: Center(
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: size,
              color: color,
            )),
      ),
    );
  }
}
