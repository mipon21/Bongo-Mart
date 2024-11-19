// ignore_for_file: prefer_const_constructors, prefer_if_null_operators

import 'package:bongo_mart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyCoiceChip extends StatelessWidget {
  const MyCoiceChip({
    super.key,
    required this.title,
    required this.isSelected,
    this.onSelected,
  });

  final String title;
  final bool isSelected;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return ChoiceChip(
      label: THelperFunctions.getColor(title) != null ? SizedBox() : Text(title),
      selectedColor: THelperFunctions.getColor(title)!=null ? THelperFunctions.getColor(title) : null,
      selected: isSelected,
      labelStyle: TextStyle(color: isSelected ? TColors.white : null),
      onSelected: onSelected,
      avatar: THelperFunctions.getColor(title) != null
          ? MyCircularContainer(
              height: 50,
              width: 50,
              backgroundColor: THelperFunctions.getColor(title)!,
            )
          : null,
      shape: THelperFunctions.getColor(title) != null ? CircleBorder() : null,
      backgroundColor: THelperFunctions.getColor(title) != null ? THelperFunctions.getColor(title) : null,
      labelPadding: THelperFunctions.getColor(title) != null ? EdgeInsets.zero : null,
      padding: THelperFunctions.getColor(title) != null ? EdgeInsets.zero : null,
    );
  }
}
