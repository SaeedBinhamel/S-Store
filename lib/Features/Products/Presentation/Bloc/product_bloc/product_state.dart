import '../../../Domain/Entities/product.dart';

sealed class ProductState {}

class ProductsInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class ProductsSuccess extends ProductState {
  final List<Product> products;

  ProductsSuccess(this.products);
}

class OneProductSuccess extends ProductState {
  final Product product;

  OneProductSuccess(this.product);
}

class ProductsError extends ProductState {
  final String message;

  ProductsError(this.message);
}
