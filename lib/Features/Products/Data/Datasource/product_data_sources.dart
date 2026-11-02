import 'dart:convert' show jsonDecode;
import 'package:electronic_ptoject/Features/Products/Data/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductDataSources {
  Future<List<ProductModel>> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse("https://dummyjson.com/products"),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> products = data['products'];

        final List<ProductModel> mainProducts = [];
        for (final product in products) {
          mainProducts.add(
            ProductModel.fromJson(product as Map<String, dynamic>),
          );
        }
        return mainProducts;
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('error:$e');
    }
  }

  Future<ProductModel> fetchDataById(int id) async {
    try {
      final response = await http.get(
        Uri.parse("https://dummyjson.com/products/$id"),
      );
      if (response.statusCode == 200) {
        final element = jsonDecode(response.body);

        ProductModel product = ProductModel.fromJson(
          element as Map<String, dynamic>,
        );

        return product;
      } else {
        throw Exception('Failed to fetch products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('error:$e');
    }
  }
}
