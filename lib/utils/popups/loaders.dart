import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class TLoaders {
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFunctions.isDarkMode(Get.context!) ? TColors.darkerGrey.withOpacity(0.9) : TColors.grey.withOpacity(0.9),
          ),
          child: Center(child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    final isDark = THelperFunctions.isDarkMode(Get.context!);
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: isDark ? Colors.white : const Color.fromARGB(255, 21, 158, 25),
      backgroundColor: Colors.green.withOpacity(0.3),
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: Icon(Iconsax.check, color: isDark ? Colors.white : Colors.green),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    final isDark = THelperFunctions.isDarkMode(Get.context!);
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: isDark ? Colors.white : Colors.orange,
      backgroundColor: Colors.orange.withOpacity(0.3),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: Icon(Iconsax.warning_2, color: isDark ? Colors.white : Colors.orange),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    final isDark = THelperFunctions.isDarkMode(Get.context!);
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: isDark ? Colors.white : Colors.red,
      backgroundColor: Colors.red.withOpacity(0.3),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: Icon(Iconsax.warning_2, color: isDark ? Colors.white : Colors.red),
    );
  }
}
