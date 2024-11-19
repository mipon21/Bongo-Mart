import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get find => Get.find();

  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageindicator(index) => currentPageIndex.value = index;
  void dotNavigatorClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('isFirstTime', false);
      Get.off(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      currentPageIndex.value = page;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }
}
