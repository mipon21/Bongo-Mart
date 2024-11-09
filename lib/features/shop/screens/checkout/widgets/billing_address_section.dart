// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/personalization/screens/address/addresses.dart';
import 'package:bongo_mart/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBillingAddressSection extends StatelessWidget {
  const MyBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MySectionHeading(
          title: 'Billing Address',
          showViewAll: true,
          buttonTitle: 'Change',
          onPressed: () => Get.to(() => const UserAddressesScreen()),
        ),
        
        MySingleAddress(isSelectedAddress: true,),
      ],
    );
  }
}
