import '../Entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProduct();
  Future<Product> getProductById(int id);
}
