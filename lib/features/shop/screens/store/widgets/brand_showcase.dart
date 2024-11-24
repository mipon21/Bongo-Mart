import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/features/shop/models/brand_model.dart';
import 'package:bongo_mart/features/shop/screens/brand/brand_products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../../common/style/rounded_container.dart';
import 'brand_card.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyBrandShowcase extends StatelessWidget {
  const MyBrandShowcase({
    super.key,
    required this.productImages,
    required this.brand,
  });

  final List<String> productImages;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () {
        Get.to(() => BrandProducts(brand: brand));
      },
      child: MyRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //Brand with Products Count
            MyBrandCard(
              brand: brand,
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
      child: CachedNetworkImage(
        fit: BoxFit.contain,

        imageUrl: image,
        progressIndicatorBuilder: (context, url, progress) =>
            const MyShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),

    ),
  );
}
