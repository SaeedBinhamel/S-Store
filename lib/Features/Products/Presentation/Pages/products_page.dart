import 'package:electronic_ptoject/Features/Products/Data/Datasource/product_data_sources.dart';
import 'package:electronic_ptoject/Features/Products/Data/Repositories/product_repository.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_bloc.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_event.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Pages/widgets/product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) {
        final dataSources = ProductDataSources();
        final repository = ProductRepository(dataSources);
        final bloc = ProductBloc(repository);
        bloc.add(FetchProductEvent());
        return bloc;
      },
      child: Scaffold(appBar: AppBar(), body: ProductBody()),
    );
  }
}
