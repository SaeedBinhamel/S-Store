import 'package:electronic_ptoject/Features/Products/Domain/Entities/product.dart';
import 'package:electronic_ptoject/Features/Products/Domain/Repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;
  GetProducts(this.repository);

  Future<List<Product>> call() {
    return repository.getProduct();
  }
}
