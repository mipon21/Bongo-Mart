import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class MyBrandTitleText extends StatelessWidget {
  const MyBrandTitleText(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textAlign,
      this.textColor,
      this.brandTitleSize});

  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final Color? textColor;
  final TextSizes? brandTitleSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: brandTitleSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: textColor)
          : brandTitleSize == TextSizes.medium 
          ? Theme.of(context).textTheme.bodyLarge!.apply(color: textColor)
          : brandTitleSize == TextSizes.large
              ? Theme.of(context).textTheme.titleLarge!.apply(color: textColor)
              : Theme.of(context).textTheme.bodyMedium!.apply(color: textColor),
    );
  }
}
