import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyVerticalImageText extends StatelessWidget {
  const MyVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    required this.textColor,
    this.onPressed,
    this.backgroundColor,
  });

  final String image;
  final String title;
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
          children: [
            // Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.md),
              decoration: BoxDecoration(
                color: backgroundColor ?? (isDark ? TColors.light : TColors.white),
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image), // Replace with your image asset
                  fit: BoxFit.cover,
                  color: isDark ? TColors.black : TColors.black,
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between icon and text
            SizedBox(
              width: 55,
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