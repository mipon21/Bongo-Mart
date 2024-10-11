// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/app.dart';
import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/curved_edges/curved_edges.dart';
import 'package:bongo_mart/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:bongo_mart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:bongo_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:bongo_mart/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  MyHomeAppBar()
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}







