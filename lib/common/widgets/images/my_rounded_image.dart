// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyRoundedImage extends StatelessWidget {
  const MyRoundedImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.fit,
    this.applyBorderRadius = false,
    this.border,
    this.backgroundColor,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  final double? height, width;
  final String imageUrl;
  final BoxFit? fit;
  final bool applyBorderRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: applyBorderRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                      child: MyShimmerEffect(
                          width: width, height: height, radius: borderRadius)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(imageUrl),
                ),
        ),
      ),
    );
  }
}
