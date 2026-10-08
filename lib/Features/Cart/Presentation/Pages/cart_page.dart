import 'package:electronic_ptoject/Features/Cart/Data/Model/cart_item.dart';
import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_cubit.dart';
import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final List<CartItem> items = state.items;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 500,

                        child: Row(
                          children: [
                            Image.network(items[index].product.imageUrl),
                            Text(items[index].product.title),
                            Text(items[index].product.description),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
