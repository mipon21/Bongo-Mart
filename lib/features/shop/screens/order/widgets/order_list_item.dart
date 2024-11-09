// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/images/my_rounded_image.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyOrderListItem extends StatelessWidget {
  const MyOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) => MyRoundedContainer(
        child: MyRoundedContainer(
          showBorder: true,
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: isDark ? TColors.dark : TColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Number: ${(index + 1).toString().padLeft(3, '0')}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                children: [
                  Icon(Iconsax.ship),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aircone Nike Shoe',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: TColors.primary,
                                fontWeightDelta: 1,
                              ),
                        ),
                        Text('07 Nov 2024',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),
                  MyRoundedImage(
                      width: 50, height: 50, imageUrl: TImages.productImage1),
                  IconButton(
                      onPressed: () {}, icon: Icon(Iconsax.arrow_right_3))
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItems),
              //Row 2
              Row(
                children: [
                  Icon(Iconsax.calendar),
                  SizedBox(width: TSizes.spaceBtwItems / 2),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Date:',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Text('14 Nov - 16 Nov, 2024',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall!),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(width: TSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order ID:',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text('BMx240001',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.status),
                        SizedBox(width: TSizes.spaceBtwItems / 2),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status:',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                'Processing...',
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(
                                      color: Colors.green,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
