// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:bongo_mart/common/widgets/products/fav_icon/fav_icon.dart';
import 'package:bongo_mart/features/shop/controllers/product/image_controller.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProductImageSlider extends StatelessWidget {
  const MyProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(ProductImageController());

    final images = controller.getAllProductImages(product);

    return MyCurvedEdgesWidgets(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            //-----Main Image-----
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargeImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                            color: isDark ? TColors.secondary : TColors.primary,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            //-----Image Slider-----

            Positioned(
              bottom: 30,
              right: 0,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      width: TSizes.spaceBtwItems,
                    );
                  },
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Obx(() {
                      final imageSelected =
                          controller.selectedProductImage.value == images[index];
                      return MyRoundedImage(
                        width: 80,
                        height: 80,
                        applyBorderRadius: true,
                        padding: const EdgeInsets.all(TSizes.sm),
                        isNetworkImage: true,
                        border: Border.all(
                          color: imageSelected
                              ? TColors.primary
                              : isDark
                                  ? TColors.darkerGrey
                                  : TColors.grey,
                        ),
                        backgroundColor: isDark ? TColors.dark : TColors.light,
                        imageUrl: images[index],
                        onPressed: () => controller.selectedProductImage.value = images[index],
                      );
                    });
                  },
                ),
              ),
            ),
            //-----AppBar-----
            MyAppBar(
              leadingIcon: Icons.arrow_back_ios_new,
              leadingOnPressed: () => Get.back(),
              // ignore: prefer_const_literals_to_create_immutables
              actions: [
                MyFavoriteIcon(
                  productId: product.id,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
