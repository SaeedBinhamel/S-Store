import 'package:equatable/equatable.dart';

import '../../Data/Model/cart_item.dart';

sealed class CartState extends Equatable {}

class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoaded extends CartState {
  final List<CartItem> items;

  CartLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

// class AddToCartState extends CartState {
//   final ProductModel product;
//
//   AddToCartState(this.product);
// }
//
// class RemoveFromCartState extends CartState {
//   final ProductModel product;
//
//   RemoveFromCartState(this.product);
// }
//
// class IncreaseQuantityState extends CartState {
//   final int quantity;
//
//   IncreaseQuantityState(this.quantity);
// }
//
// class DecreaseQuantityState extends CartState {
//   final int quantity;
//
//   DecreaseQuantityState(this.quantity);
// }
