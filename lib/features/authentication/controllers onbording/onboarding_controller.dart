import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
    if(currentPageIndex.value == 2){
      return;
    }
    else {
      int page =currentPageIndex.value+1;
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
