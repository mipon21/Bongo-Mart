import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MyFormDevider extends StatelessWidget {
  const MyFormDevider({
    super.key,
    required this.isDark, required this.title,
  });

  final bool isDark;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: isDark ? TColors.darkGrey : TColors.grey,
          thickness: 1,
          indent: 60,
          endIndent: 5,
        )),
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
            child: Divider(
          color: isDark ? TColors.darkGrey : TColors.grey,
          thickness: 1,
          indent: 5,
          endIndent: 60,
        ))
      ],
    );
  }
}
