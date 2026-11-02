import '../../../Domain/Entities/product.dart';

sealed class ProductState {}

class ProductsInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class ProductsSuccess extends ProductState {
  final List<Product> products;

  ProductsSuccess(this.products);
}

class ProductsError extends ProductState {
  final String message;

  ProductsError(this.message);
}
