import 'package:camera_flutter/themes/color_style.dart';
import 'package:flutter/material.dart';

class TextThemeStyleApp {
  static TextStyle normal400 = const TextStyle(
    color: MyAppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    //  fontFamily: cho phong chu vao day
  );
  static TextStyle large500 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: '',
  );
}
