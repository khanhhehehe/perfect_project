import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600,
              // fontFamily: "SFCompact"
              ),
          iconTheme: IconThemeData(color: Colors.white)),
      iconTheme: IconThemeData(color: Colors.white)

    );
  }
}
