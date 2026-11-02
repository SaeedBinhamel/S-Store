import 'package:electronic_ptoject/Features/Cart/Data/Model/cart_item.dart';
import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_state.dart';
import 'package:electronic_ptoject/Features/Products/Data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Products/Domain/Entities/product.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<CartItem> items = [];

  void addToCart(Product product) {
    final index = items.indexWhere((item) {
      return item.product.id == product.id;
    });

    if (index == -1) {
      // المنتج غير موجود
      items.add(CartItem(product: product, quantity: 1));
      emit(CartLoaded(List.from(items)));
    } else {
      increaseQuantity(product);
    }
  }

  void increaseQuantity(Product product) {
    final index = items.indexWhere((item) {
      return item.product.id == product.id;
    });
    if (index == -1) {
      return;
    } else {
      final oldItem = items[index];

      items[index] = CartItem(
        product: oldItem.product,
        quantity: oldItem.quantity + 1,
      );
    }

    emit(CartLoaded(List.from(items)));
  }

  void removeFromCart(Product product) {
    final index = items.indexWhere((item) {
      return item.product.id == product.id;
    });
    if (index != -1) {
      items.removeAt(index);
    }

    emit(CartLoaded(List.from(items)));
  }

  void decreaseQuantity(Product product) {
    final index = items.indexWhere((item) {
      return item.product.id == product.id;
    });
    if (index == -1) {
      return;
    }

    if (items[index].quantity > 1) {
      final oldItem = items[index];
      items[index] = CartItem(
        product: oldItem.product,
        quantity: oldItem.quantity - 1,
      );
    } else {
      items.removeAt(index);
    }
    emit(CartLoaded(List.from(items)));
  }
}
