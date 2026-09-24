import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    @required this.inputType,
    this.suffexIcon,
    this.onSave,
    this.onChanged,
    this.maxLines,
  });
  final TextInputType? inputType;
  final Widget? suffexIcon;
  final ValueSetter? onSave;
  final dynamic onChanged;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      onSaved: onSave,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xffcccccc)),
        ),
      ),
    );
  }
}
