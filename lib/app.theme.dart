import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: MyAppColors.white, fontSize: 20,
              fontWeight: FontWeight.w600,
              // fontFamily: "SFCompact"
            ),
            iconTheme: IconThemeData(color: Colors.white)),
        textSelectionTheme: const TextSelectionThemeData(
            selectionColor: MyAppColors.cusorColor,
            cursorColor: MyAppColors.cusorColor,
            selectionHandleColor: MyAppColors.cusorColor),
        iconTheme: const IconThemeData(color: MyAppColors.white));
  }
}
