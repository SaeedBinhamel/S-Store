import 'package:flutter/material.dart';
import '../size_config.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({
    super.key,
    required this.text,
    this.onTap,
    this.colorText,
    this.colorBG,
  });
  final String text;
  final Color? colorText;
  final Color? colorBG;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 40,
        // width: 150,
        decoration: BoxDecoration(
          color: colorBG,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: colorText,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// class CustomGeneralButtonWithIcon extends StatelessWidget {
//   const CustomGeneralButtonWithIcon({
//     super.key,
//     this.text,
//     this.onTap,
//     this.iconData,
//     this.color,
//   });
//   final String? text;
//   final VoidCallback? onTap;
//   final dynamic iconData;
//   final Color? color;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 60,
//         width: SizeConfig.screenWidth,
//         decoration: BoxDecoration(
//           color: Colors.tealAccent,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: Colors.black),
//         ),
//         child: Row(
//           children: [
//             HorizontalSpace(4),
//             Text(
//               text!,
//               style: TextStyle(
//                 fontFamily: 'Poppins',
//                 fontSize: 14,
//                 color: Color(0xff000000),
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.left,
//             ),
//             HorizontalSpace(2),
//             Icon(iconData, color: color),
//           ],
//         ),
//       ),
//     );
//   }
// }
