import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_event.dart';
import 'package:electronic_ptoject/Features/Products/Presentation/Bloc/product_bloc/product_state.dart';
import 'package:electronic_ptoject/Features/Products/Domain/UseCases/get_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc(this.getProducts) : super(ProductsInitial()) {
    on<FetchProductEvent>((event, emit) async {
      emit(ProductsLoading());
      try {
        final products = await getProducts
            .call(); //  او يمكن استخدام ()getProducts مباشرة لاننا عرفناها باستخدام call

        emit(ProductsSuccess(products));
      } catch (e) {
        emit(ProductsError("Error: $e"));
      }
    });
  }
}
