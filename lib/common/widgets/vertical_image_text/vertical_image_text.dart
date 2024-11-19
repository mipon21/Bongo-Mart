import 'package:bongo_mart/common/widgets/images/my_circular_Image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyVerticalImageText extends StatelessWidget {
  const MyVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.isNetworkImage = true,
    required this.textColor,
    this.onPressed,
    this.backgroundColor,
  });

  final String image;
  final String title;
  final bool isNetworkImage;
  final Color textColor;
  final void Function()? onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
            right: TSizes.spaceBtwItems), // Adds space between items
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Icon
            MyCircularImage(
              height: 56,
              width: 56,
              isDark: isDark,
              fit: BoxFit.fitWidth,
              padding: const EdgeInsets.all(TSizes.sm*1.4),
              imageUrl: image,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: isDark ? TColors.white : TColors.black,

            ),
            const SizedBox(height: 8), // Spacing between icon and text
            SizedBox(
              child: Text(
                title, // Replace with actual category name
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
