// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MySingleAddress extends StatelessWidget {
  const MySingleAddress({
    super.key,
    required this.isSelectedAddress,
  });
  final bool isSelectedAddress;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return MyRoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: isSelectedAddress
          ? isDark
              ? TColors.secondary.withOpacity(0.5)
              : TColors.primary.withOpacity(0.3)
          : Colors.transparent,
      borderColor: isSelectedAddress
          ? Colors.transparent
          : isDark
              ? TColors.darkGrey
              : TColors.grey,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              isSelectedAddress ? Iconsax.tick_circle5 : null,
              color: isSelectedAddress ? TColors.primary : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Iconsax.user, size: 18, color: Colors.grey,),
                  SizedBox(width: TSizes.spaceBtwItems/2,),
                  Text(
                    'Mipon Rahman',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(height: TSizes.sm / 2),
              Row(
                children: [
                  Icon(Iconsax.call, size: 18, color: Colors.grey,),
                  SizedBox(width: TSizes.spaceBtwItems/2,),
                  Text(
                    '(+880) 1712345678',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: TSizes.sm / 2),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Iconsax.location, size: 18, color: Colors.grey,),
                  SizedBox(width: TSizes.spaceBtwItems/2,),
                  Expanded(
                    child: Text(
                      '40/14 Jalalabad R/A, Sylhet Sadar, Sylhet, Postal Code: 3100',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: isSelectedAddress
                          ? Theme.of(context).textTheme.titleSmall
                          : Theme.of(context).textTheme.bodySmall,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.sm / 2),
            ],
          )
        ],
      ),
    );
  }
}
