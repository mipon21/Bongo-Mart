// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    final context = Get.overlayContext;
    if (context != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false, // Prevent dialog from closing with back button
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!) ? TColors.secondary : TColors.light,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(animation,),
                  Text(text, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  static void stopLoading() {
    final context = Get.overlayContext;
    if (context != null) {
      Navigator.of(context).pop();
    }
  }
}
