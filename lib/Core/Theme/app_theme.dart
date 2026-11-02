import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Cairo",
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.light,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: "Cairo",
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: Color(0xFF121212),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.dark,
    ),
  );
}
