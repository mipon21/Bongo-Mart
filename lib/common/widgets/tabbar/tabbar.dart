import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/device/device_utility.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MyTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Material(
      color: Colors.transparent,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: isDark ? TColors.secondary : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: isDark ? TColors.white : TColors.primary,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
