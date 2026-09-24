import 'package:electronic_ptoject/Features/Products/Presentation/Pages/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ProductCard(
          image: "https://placehold.co/145x150",
          title: "ملبس",
          price: "250\$",
        ),
      ),
    );
  }
}
