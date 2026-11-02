import 'package:electronic_ptoject/Features/Products/Domain/Repositories/product_repository.dart';

import '../Entities/product.dart';

class GetProductById {
  final ProductRepository repository;
  GetProductById(this.repository);
  Future<Product> call(int id) {
    return repository.getProductById(id);
  }
}
