import 'package:electronic_ptoject/Features/Products/Data/models/product_model.dart';

sealed class ProductState {}

class ProductsInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class ProductsSuccess extends ProductState {
  final List<ProductModel> products;

  ProductsSuccess(this.products);
}

class ProductsError extends ProductState {
  final String message;

  ProductsError(this.message);
}
