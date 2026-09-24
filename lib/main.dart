import 'package:electronic_ptoject/Core/Theme/app_theme.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Pages/products_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.lightTheme, home: ProductsPage());
  }
}
