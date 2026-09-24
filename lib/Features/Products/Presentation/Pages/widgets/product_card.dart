import 'package:electronic_ptoject/Core/Theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/widgets/custom_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });
  final String image;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(image),
          Text(title, style: TextStyle(color: AppColor.primaryText)),
          Text(price, style: TextStyle(color: AppColor.primary)),
          CustomGeneralButton(
            text: '+ أضف للسلة',
            colorBG: AppColor.specialBackground,
            colorText: AppColor.primary,
          ),
        ],
      ),
    );
  }
}
