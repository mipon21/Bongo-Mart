import '../../../../../common/style/rounded_container.dart';
import '../../../../../common/widgets/icons/brand_title_with_verified_icon.dart';
import '../../../../../common/widgets/images/my_circular_Image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyBrandCard extends StatelessWidget {
  const MyBrandCard({
    super.key,
    this.onTap,
    this.showBorder = true,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: MyRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //Icon
            Flexible(
              child: MyCircularImage(
                isDark: isDark,
                imageUrl: TImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? TColors.white : TColors.dark,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            //Brand Name
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyBrandTitleWithVerifiedIcon(
                    title: 'Nike',
                    brandTitleSize: TextSizes.large,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 3),
                  Text(
                    '256 products',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )

            //Brand Logo
          ],
        ),
      ),
    );
  }
}
