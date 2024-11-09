import '../../constants/colors.dart';
import 'package:flutter/material.dart';

class TSwitchTheme {
  TSwitchTheme._(); // Private constructor to prevent instantiation

  // Light theme switch styling
  static SwitchThemeData lightSwitchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.all(TColors.white),
    
   // overlayColor: MaterialStateProperty.all(TColors.white),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.primary; // Color when switch is ON
      }
      return TColors.grey; // Color when switch is OFF
    }),
  );

  // Dark theme switch styling
  static SwitchThemeData darkSwitchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.all(TColors.white),
    overlayColor: WidgetStateProperty.all(TColors.darkGrey),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.secondary; // Color when switch is ON
      }
      return TColors.darkGrey; // Color when switch is OFF
    }),
  );
}
