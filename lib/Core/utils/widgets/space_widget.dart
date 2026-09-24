import 'package:flutter/material.dart';
import '../size_config.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.value, {super.key});
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: SizeConfig.defaultSize * value);
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.value, {super.key});
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: SizeConfig.defaultSize * value);
  }
}
