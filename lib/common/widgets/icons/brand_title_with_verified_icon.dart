import 'package:bongo_mart/common/widgets/text/brand_title_text.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/enums.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyBrandTitleWithVerifiedIcon extends StatelessWidget {
  const MyBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTitleSize,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes? brandTitleSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: MyBrandTitleText(
          title: title,
          textColor: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
        )),
        SizedBox(width: TSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        ),
      ],
    );
  }
}