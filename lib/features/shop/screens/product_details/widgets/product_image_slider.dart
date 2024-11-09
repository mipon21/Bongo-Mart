
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyProductImageSlider extends StatelessWidget {
  const MyProductImageSlider({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return MyCurvedEdgesWidgets(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            //-----Main Image-----
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace * 2),
                child: Center(
                    child: Image(
                        image: AssetImage(TImages.productImage1))),
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
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return MyRoundedImage(
                      width: 80,
                      applyBorderRadius: true,
                      padding: const EdgeInsets.all(TSizes.sm),
                      border: Border.all(color: TColors.secondary),
                      backgroundColor:
                          isDark ? TColors.dark : TColors.light,
                      imageUrl: TImages.productImage1,
                    );
                  },
                ),
              ),
            ),
            //-----AppBar-----
            MyAppBar(
              leadingIcon: Icons.arrow_back_ios_new,
              leadingOnPressed: () => Get.back(),
              actions: [
                MyCircularFavoriteIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}