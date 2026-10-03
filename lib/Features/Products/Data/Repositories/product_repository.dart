import 'package:electronic_ptoject/Features/Products/Data/models/product_model.dart';
import '../Datasource/product_data_sources.dart';

class ProductRepository {
  final ProductDataSources dataSources;
  ProductRepository(this.dataSources);

  Future<List<ProductModel>> getProduct() {
    return dataSources.fetchData();
  }
}
