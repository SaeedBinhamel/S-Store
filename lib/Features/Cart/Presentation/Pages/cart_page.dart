import 'package:electronic_ptoject/Core/Theme/app_color.dart';
import 'package:electronic_ptoject/Features/Cart/Data/Model/cart_item.dart';
import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_cubit.dart';
import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_state.dart';
import 'package:electronic_ptoject/Features/Cart/Presentation/pages/widgets/card_item_info.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/pages/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('عودة'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final List<CartItem> items = state.items;
            if (items.isNotEmpty) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return CardItemInfo(
                          plus: () => context
                              .read<CartCubit>()
                              .increaseQuantity(items[index].product),
                          min: () => context.read<CartCubit>().decreaseQuantity(
                            items[index].product,
                          ),
                          dele: () => context.read<CartCubit>().removeFromCart(
                            items[index].product,
                          ),
                          title: items[index].product.title,
                          imageUrl: items[index].product.imageUrl,
                          price: items[index].product.price,
                          quantity: items[index].quantity,
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColor.specialBackground,

                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: TotalPriceItem(items: items),
                  ),
                ],
              );
            } else {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("No products in you cart"),
                    TextButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: Text('add'),
                    ),
                  ],
                ),
              );
            }
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("No products in you cart"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductsPage()),
                      );
                    },
                    child: Text('add'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

double totalPrice(List<CartItem> items) {
  double totalPrice = 0;
  for (CartItem item in items) {
    totalPrice += item.product.price * item.quantity;
  }
  return totalPrice;
}

class TotalPriceItem extends StatelessWidget {
  const TotalPriceItem({super.key, required this.items});

  final List<CartItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryText,
          ),
        ),
        Text(
          '\$${totalPrice(items).toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ],
    );
  }
}
