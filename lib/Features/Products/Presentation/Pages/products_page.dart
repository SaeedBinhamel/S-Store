import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_cubit.dart';
import 'package:electronic_ptoject/Features/Cart/Presentation/Pages/cart_page.dart';
import 'package:electronic_ptoject/Features/Products/Data/Datasource/product_data_sources.dart';
import 'package:electronic_ptoject/Features/Products/Data/Repositories/product_repository.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_bloc.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_event.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Pages/widgets/product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

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
      ),
      body: ProductBody(),
    );
  }
}
