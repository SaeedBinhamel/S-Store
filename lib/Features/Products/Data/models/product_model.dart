import 'package:electronic_ptoject/Features/Products/Domain/Entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.imageUrl,
    required super.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num)
          .toDouble(), // لأن int وdouble كلاهما يرثان من num
      imageUrl: json['images'][0],
      description: json['description'],
    );
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      price: price,
      imageUrl: imageUrl,
      description: description,
    );
  }

  // ProductModel.fromJson(Map<String, dynamic> json)
  //   : id = json['id'],
  //     title = json['title'],
  //     price = json['price'].toDouble(),
  //     imageUrl = json['images'][0],
  //     description = json['description'];
}
