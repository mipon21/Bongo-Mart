import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyRoundedContainer extends StatelessWidget {
  const MyRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = TSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = TColors.borderPrimary,
      this.backgroundColor = TColors.white,
      this.padding,
      this.margin});

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
