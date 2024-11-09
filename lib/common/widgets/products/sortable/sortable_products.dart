
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MySortableProducts extends StatelessWidget {
  const MySortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          onChanged: (value) {},
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.category),
            hintText: '',
            hintStyle: TextStyle(
              fontSize: 12,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSizes.md),
            ),
          ),
          hint: Center(
            child: Text(
              'Select Category',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ].map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
        ),
        SizedBox(height: TSizes.spaceBtwSections),
        MyGridLayout(
          itemCount: 10,
          itemBuilder: (_, index) => MyProductCardVertical(),
        )
      ],
    );
  }
}
