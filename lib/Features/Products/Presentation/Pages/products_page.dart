import 'package:electronic_ptoject/Features/Products/Presentation/Pages/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../Data/models/product_model.dart';

final List<ProductModel> products = [
  ProductModel(
    title: 'Phone',
    price: 250,
    imageUrl: "assets/images/images1.jpg",
  ),
  ProductModel(
    title: 'Tablet',
    price: 4050,
    imageUrl: "assets/images/images1.jpg",
  ),
  ProductModel(
    title: 'Laptop',
    price: 100020,
    imageUrl: "assets/images/images1.jpg",
  ),
];

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.86, //نسبة عرض الخلية الى ارتفاعها
            crossAxisSpacing: 10, //المسافة الجانبية بين البطاقات
            mainAxisSpacing: 10, //المسافة الراسية بين البطاقات
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              image: products[index].imageUrl,
              title: products[index].title,
              price: products[index].price,
            );
          },
        ),
      ),
    );
  }
}
