// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyBillingPaymentSection extends StatelessWidget {
  const MyBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        MySectionHeading(
          title: 'Payment Method',
          showViewAll: true,
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            MyRoundedContainer(
              width: 50,
              height: 25,
              backgroundColor: isDark ? TColors.dark : TColors.white,
              child: Image(image: AssetImage(TImages.paypal),fit: BoxFit.contain,),
            ),
            SizedBox(width: TSizes.spaceBtwItems/2,),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}
