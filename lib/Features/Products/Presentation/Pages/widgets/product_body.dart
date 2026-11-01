import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_cubit.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_bloc.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_state.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Pages/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Bloc/product_bloc/product_event.dart';
import '../product_details_page.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductsSuccess) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75, //نسبة عرض الخلية الى ارتفاعها
                crossAxisSpacing: 10, //المسافة الجانبية بين البطاقات
                mainAxisSpacing: 10, //المسافة الراسية بين البطاقات
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(
                  image: product.imageUrl,
                  id: product.id,
                  title: product.title,
                  price: product.price,
                  description: product.description,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         ProductDetailsPage(productId: product.id),
                    //   ),
                    // );
                    context.push('/products/${product.id}');
                  },
                  btnOnTap: () {
                    context.read<CartCubit>().addToCart(product);
                  },
                );
              },
            ),
          );
        } else if (state is ProductsError) {
          return InkWell(
            child: Text(state.message),
            onTap: () {
              context.read<ProductBloc>().add(FetchProductEvent());
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
