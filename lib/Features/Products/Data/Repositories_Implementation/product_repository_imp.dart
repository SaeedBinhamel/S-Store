import 'package:electronic_ptoject/Features/Products/Domain/Repositories/product_repository.dart';
import '../../Domain/Entities/product.dart';
import '../Datasource/product_data_sources.dart';

class ProductRepositoryImp implements ProductRepository {
  final ProductDataSources dataSources;
  ProductRepositoryImp(this.dataSources);

  @override
  Future<List<Product>> getProduct() async {
    final products = await dataSources
        .fetchData(); //هنا تكون على صورة product model
    return products
        .map((product) => product.toEntity())
        .toList(); // هنا يحولها على صورة Product
  }

  @override
  Future<Product> getProductById(int id) async {
    final product = await dataSources.fetchDataById(id);
    return product.toEntity();
  }
}

// Future<List<ProductModel>> getProduct()  {
//   return dataSources.fetchData();
// }
