import 'package:electronic_ptoject/Core/Theme/Cubit/them_Cubit.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/pages/widgets/product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.push('/cart');
          },
          icon: Icon(Icons.shopping_cart_rounded),
        ),
        actions: [
          BlocBuilder<ThemCubit, ThemeMode>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(state.isLight ? Icons.dark_mode : Icons.light_mode),
                onPressed: () {
                  context.read<ThemCubit>().toggleTheme();
                },
              );
            },
          ),
        ],
      ),
      body: ProductBody(),
    );
  }
}
