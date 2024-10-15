import 'package:bongo_mart/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:bongo_mart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyPrimaryHeaderContainer extends StatelessWidget {
  const MyPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.height,
  });

  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return MyCurvedEdgesWidgets(
      child: SizedBox(
        height: height,
        child: Container(
          color: isDark ? TColors.secondary : TColors.primary,
          padding: const EdgeInsets.only(bottom: TSizes.md),
          margin: const EdgeInsets.all(0),
          child: Stack(
            children: [
              Positioned(
                top: -150.0,
                right: -250.0,
                child: MyCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100.0,
                right: -300.0,
                child: MyCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
