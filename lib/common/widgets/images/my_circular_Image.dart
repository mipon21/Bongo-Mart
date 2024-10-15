import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyCircularImage extends StatelessWidget {
  const MyCircularImage({
    super.key,
    required this.isDark,
    this.height = 56,
    this.width = 56,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(TSizes.sm),
    this.isNetworkImage = false,  this.overlayColor ,
  });

  final bool isDark;
  final double height, width;
  final String imageUrl;
  final BoxFit? fit;
  final Color? backgroundColor;
  final Color? overlayColor;
  final EdgeInsetsGeometry padding;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDark ? TColors.dark : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
        color: overlayColor,
      ),
    );
  }
}
