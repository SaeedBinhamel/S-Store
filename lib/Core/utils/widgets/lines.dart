import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    super.key,
    required this.height,
    required this.horizontalPadding,
    this.color = Colors.grey,
  });
  final double height;
  final double horizontalPadding;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(height: height, color: color),
    );
  }
}
