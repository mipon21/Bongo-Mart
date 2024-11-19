// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyRoundedBannerImage extends StatelessWidget {
  const MyRoundedBannerImage({
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
    this.margin,
  });

  final double? height, width;
  final String imageUrl;
  final BoxFit? fit;
  final bool applyBorderRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
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
        margin: margin,
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
                  height: height,
                  width: width,
                  fadeInCurve: Curves.fastEaseInToSlowEaseOut,
                  fadeOutCurve: Curves.fastEaseInToSlowEaseOut,
                  fadeInDuration: const Duration(milliseconds: 1),
                  fadeOutDuration: const Duration(milliseconds: 1),
                  fit: fit,
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, progress) => Center(
                      child: MyShimmerEffect(
                          width: double.infinity, height: 190, radius: 20)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(TImages.banner1) as ImageProvider,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
