import 'package:bongo_mart/features/shop/controllers/product/all_product_controller.dart';
import 'package:bongo_mart/features/shop/models/product_model.dart';
import 'package:get/get.dart';

import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MySortableProducts extends StatelessWidget {
  const MySortableProducts({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField<String>(
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          value: controller.selectedSortOption.value,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.category),
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
          ]
              .map((String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        Obx(() {
          return MyGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => MyProductCardVertical(
              product: controller.products[index],
            ),
          );
        })
      ],
    );
  }
}
