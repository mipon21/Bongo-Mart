
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class MyRatingProgressIndicator extends StatelessWidget {
  const MyRatingProgressIndicator({
    super.key, required this.rating, required this.text,
  });

  final double rating;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width:
                TDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: rating,
              minHeight: 11,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(
                  TColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}