import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Cairo",
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.mainBackground,
  );
  static ThemeData darkTheme = ThemeData();
}
