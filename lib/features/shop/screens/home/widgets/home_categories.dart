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
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return MyVerticalImageText(
            image: TImages.acerlogo,
            title: "Shoes",
            textColor: TColors.white, 
            onPressed: () => Get.to(const SubCategoryScreen()),
          );
        },
      ),
    );
  }
}