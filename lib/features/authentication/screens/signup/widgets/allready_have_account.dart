import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllreadyHaveAccount extends StatelessWidget {
  const AllreadyHaveAccount({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    // Screen width to determine scaling
    double screenWidth = MediaQuery.of(context).size.width;

    // Define font size scaling based on screen size (mobile vs desktop)
    double fontSizeSmall = screenWidth < 600 
        ? screenWidth * 0.035 // Mobile scaling
        : 14; // Desktop fallback size
    double fontSizeMedium = screenWidth < 600 
        ? screenWidth * 0.04 // Mobile scaling
        : 16; // Desktop fallback size

    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the text
      children: [
        Text(
          '${TTexts.alreadyHaveAccount} ', // Existing text
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: fontSizeSmall, // Responsive size for small text
              ),
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text(
            TTexts.signIn,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(
                  color: isDark ? TColors.white : TColors.primary,
                )
                .copyWith(
                  fontSize: fontSizeMedium, // Responsive size for medium text
                ),
          ),
        ),
      ],
    );
  }
}
