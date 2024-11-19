// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/common/widgets/images/my_rounded_banner_image.dart';
import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/features/shop/controllers/banner/banner_controller.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../controllers/home/home_contoller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({
    super.key,
    this.autoPlay = true,
  });

  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController()); // Use find instead of put to reuse the instance
    final isDark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => controller.isLoading.value && controller.banners.isEmpty
          ? Center(child: Text('No Data Found'))
          : Column(
              children: [
                controller.isLoading.value
                    ? MyShimmerEffect(width: double.infinity, height: 190)
                    : CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: autoPlay,
                          autoPlayInterval: const Duration(seconds: 3),
                          viewportFraction: 1.1,
                          onPageChanged: (index, _) =>
                              controller.updateCarouselIndex(index),
                        ),
                        items: controller.banners
                            .map((banner) => MyRoundedBannerImage(
                                  height: 190,
                                  applyBorderRadius: true,
                                  borderRadius: 20,
                                  fit: BoxFit.cover,
                                  padding: EdgeInsets.all(5),
                                  imageUrl: banner.imageUrl,
                                  isNetworkImage: true,
                                  onPressed: () =>
                                      Get.toNamed(banner.targetScreen),
                                ))
                            .toList(),
                      ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      MyCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? isDark
                                    ? TColors.secondary
                                    : TColors.primary
                                : TColors.grey,
                      ),
                  ],
                ),
              ],
            ),
    );
  }
}

