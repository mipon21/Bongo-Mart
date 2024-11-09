
// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/widgets/icons/circular_icon.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyProductQuantityWithAddRemoveBtn extends StatelessWidget {
  const MyProductQuantityWithAddRemoveBtn({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyCircularFavoriteIcon(
          height: 32,
          width: 32,
          size: 15,
          icon: Iconsax.minus,
          color: isDark ? TColors.white : TColors.dark,
          backgroundColor: isDark
              ? TColors.darkGrey.withOpacity(0.8)
              : TColors.light,
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        MyCircularFavoriteIcon(
          height: 32,
          width: 32,
          size: 15,
          icon: Iconsax.add,
          color: TColors.white,
          backgroundColor: isDark
              ? TColors.secondary.withOpacity(0.8)
              : TColors.primary.withOpacity(0.8),
        ),
      ],
    );
  }
}
