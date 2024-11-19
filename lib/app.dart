
// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/bindings/general_bindings.dart';
import 'package:bongo_mart/routes/app_routes.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:lottie/lottie.dart';
import 'utils/constants/text_strings.dart';
import 'utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = THelperFunctions.isDarkMode(context);
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialBinding: GeneralBindings(),
      home: Scaffold(
        backgroundColor: isDarkMode ? TColors.secondary : TColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            backgroundColor: isDarkMode ? TColors.secondary : TColors.primary,
          ),
        ),
      )
    );
  }
}
