import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/features/shop/screens/store/widgets/brand_card.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyBrandShowcase extends StatelessWidget {
  const MyBrandShowcase({
    super.key,
    required this.productImages,
  });

  final List<String> productImages;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return MyRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          //Brand with Products Count
          const MyBrandCard(
            showBorder: false,
          ),

          //Brand Top 3 Products
          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
            children: productImages
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  final isDark = THelperFunctions.isDarkMode(context);
  return Expanded(
    child: MyRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
      margin: const EdgeInsets.only(right: TSizes.sm),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
