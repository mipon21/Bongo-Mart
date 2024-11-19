// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyCircularImage extends StatelessWidget {
  const MyCircularImage({
    super.key,
    required this.isDark,
    this.height = 80,
    this.width = 80,
    this.imageWidth,
    this.imageHeight,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.padding = const EdgeInsets.all(TSizes.sm),
    this.isNetworkImage = false,
    this.overlayColor,
  });

  final bool isDark;
  final double height, width;
  final double? imageWidth, imageHeight;
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  imageUrl: imageUrl,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, progress) =>
                      Center(child: MyShimmerEffect(width: width, height: height, radius: 80)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(imageUrl),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
