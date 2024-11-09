import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../controllers/home_contoller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({
    super.key,
    required this.promoImages,
    this.autoPlay = true,
  });

  final List<String> promoImages;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: autoPlay,
            autoPlayInterval: const Duration(seconds: 3),
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updateCarouselIndex(index),
          ),
          items:
              promoImages.map((url) => MyRoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < promoImages.length; i++)
                MyCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carousalCurrentIndex.value == i
                      ? isDark ? TColors.secondary : TColors.primary
                      : TColors.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
