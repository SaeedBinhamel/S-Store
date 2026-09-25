import 'package:electronic_ptoject/Core/Theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/size_config.dart';
import '../../../../../Core/utils/widgets/custom_button.dart';
import '../../../../../Core/utils/widgets/space_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });
  final String image;
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    // SizeConfig.init(context);
    return Container(
      constraints:
          const BoxConstraints(), //نقدر هنا نحدد اعلى واقل ارتفاع او عرض ممكن
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColor.secondaryText,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
        color: AppColor.secondaryBackground,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min, //نقول للكولم خذ المساحة الي تحتاجها بس
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.asset(image, fit: BoxFit.contain),
          ),

          Text(
            title,
            style: TextStyle(color: AppColor.primaryText),
            maxLines: 3,
            overflow:
                TextOverflow.ellipsis, //علشان لو زاد طول النص يحوله الى نقاط
          ),
          // VerticalSpace(2),
          Text('$price', style: TextStyle(color: AppColor.primary)),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: CustomGeneralButton(
              text: ' أضف للسلة +',
              colorBG: AppColor.specialBackground,
              colorText: AppColor.primary,
            ),
          ),
        ],
      ),
    );
  }
}
