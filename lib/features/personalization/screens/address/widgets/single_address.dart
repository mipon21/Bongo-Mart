// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/features/personalization/controller/address_controller.dart';
import 'package:bongo_mart/features/personalization/models/address_model.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MySingleAddress extends StatelessWidget {
  const MySingleAddress({
    super.key,
    required this.onTap,
    required this.onPressed,
    required this.address,
  });
  final VoidCallback onTap;
  final VoidCallback onPressed;
  final AddressModel address;
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final isSelectedAddress = selectedAddressId == address.id;
      return GestureDetector(
        onTap: onTap,
        child: MyRoundedContainer(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Iconsax.user,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),
                            Text(
                              address.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        SizedBox(height: TSizes.sm / 2),
                        Row(
                          children: [
                            Icon(
                              Iconsax.call,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),
                            Text(
                              address.phoneNumber,
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
                            Icon(
                              Iconsax.location,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: TSizes.spaceBtwItems / 2,
                            ),
                            Expanded(
                              child: Text(
                                address.toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: isSelectedAddress
                                    ? Theme.of(context).textTheme.titleSmall
                                    : Theme.of(context).textTheme.bodySmall,
                                softWrap: true,
                              ),
                            ),
                            IconButton(
                              onPressed: onPressed,
                              icon: const Icon(Iconsax.trash,
                                  color: TColors.error),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
