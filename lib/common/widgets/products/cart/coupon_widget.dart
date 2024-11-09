
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyCouponCode extends StatelessWidget {
  const MyCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return MyRoundedContainer(
      showBorder: true,
      padding: EdgeInsets.only(
          top: TSizes.sm,
          bottom: TSizes.sm,
          left: TSizes.sm,
          right: TSizes.sm),
      backgroundColor: isDark ? TColors.dark : TColors.light,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a coupon? Enter here',
                hintStyle: Theme.of(context).textTheme.bodySmall,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: TSizes.spaceBtwItems),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Apply'),
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark
                    ? TColors.white.withOpacity(0.5)
                    : TColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
