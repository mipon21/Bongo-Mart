import 'package:bongo_mart/common/widgets/vertical_image_text/vertical_image_text.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
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
          return const MyVerticalImageText(
            image: TImages.acerlogo,
            title: "Shoes",
            textColor: TColors.white, 
          );
        },
      ),
    );
  }
}