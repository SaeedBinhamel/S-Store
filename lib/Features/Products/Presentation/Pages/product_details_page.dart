import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_cubit.dart';
import 'package:electronic_ptoject/Features/Products/Data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Theme/app_color.dart';
import '../../../../Core/utils/widgets/custom_button.dart';
import '../../../../Core/utils/widgets/lines.dart';
import '../../../Cart/Presentation/Pages/cart_page.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
          icon: Icon(Icons.shopping_cart_rounded),
        ),
        centerTitle: true,
        title: Text(
          'Product Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // leading: Align(
        //   alignment: Alignment(5, 0),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: AppColor.secondaryBackground,
        //       borderRadius: BorderRadius.circular(50),
        //     ),
        //     child: IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(Icons.keyboard_backspace),
        //     ),
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                spacing: 5,
                children: [
                  Container(
                    margin: EdgeInsetsGeometry.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColor.specialBackground,
                    ),
                    child: Image.network(product.imageUrl, fit: BoxFit.contain),
                  ),

                  Text(
                    product.title,
                    style: TextStyle(
                      color: AppColor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${product.price}\$',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  HorizontalLine(
                    height: 1,
                    horizontalPadding: 5,
                    color: AppColor.primary,
                  ),

                  // Spacer(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Description:",
                      style: TextStyle(
                        color: AppColor.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    product.description,
                    style: TextStyle(
                      color: AppColor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),

          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.heart_broken,
                      size: 40,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 0),
                    child: CustomGeneralButton(
                      onTap: () {
                        context.read<CartCubit>().addToCart(product);
                      },
                      text: ' أضف للسلة +',
                      colorBG: AppColor.specialBackground,
                      colorText: AppColor.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
