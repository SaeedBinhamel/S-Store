import 'package:electronic_ptoject/Features/Products/Data/models/product_model.dart';

class CartItem {
  final ProductModel product;
  final int quantity;

  const CartItem({required this.product, required this.quantity});
}
