import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/device/device_utility.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MySearchContainer extends StatelessWidget {
  const MySearchContainer({
    super.key,  this.text = "Search", this.icon,  this.showBackground = true,  this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      width: TDeviceUtils.getScreenWidth(context) * 0.9,
      padding: const EdgeInsets.all(TSizes.md),
      decoration: BoxDecoration(
        color: showBackground ? isDark ? TColors.secondary.withOpacity(0.1) : TColors.light : Colors.transparent,
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        border: showBorder ? Border.all(color: TColors.grey) : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: TColors.darkGrey,),
          const SizedBox(width: TSizes.spaceBtwItems,),
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}