// ignore_for_file: unused_local_variable

import 'package:bongo_mart/common/widgets/shimmer/category_shimmer.dart';
import 'package:bongo_mart/features/shop/controllers/category/category_controller.dart';
import '../../sub_category/sub_category.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/vertical_image_text/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class MyHomeCategories extends StatelessWidget {
  const MyHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const MyCategoryShimmer();
      }
      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No categories found",
            style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.white),
          ),
        );
      }

      return SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            return MyVerticalImageText(
              image: category.image,
              title: category.name,
              textColor: TColors.white,
              onPressed: () => Get.to(const SubCategoryScreen()),
            );
          },
        ),
      );
    });
  }
}
