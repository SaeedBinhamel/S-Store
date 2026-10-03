import 'package:electronic_ptoject/Features/Products/Data/Repositories/product_repository.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_event.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductsInitial()) {
    on<FetchProductEvent>((event, emit) async {
      emit(ProductsLoading());
      try {
        final products = await repository.getProduct();

        emit(ProductsSuccess(products));
      } catch (e) {
        emit(ProductsError("Error: $e"));
      }
    });
  }
}
