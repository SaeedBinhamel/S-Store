class ProductModel {
  final int id;
  final String title;
  final double price;
  final String imageUrl;
  final String description;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      price = json['price'].toDouble(),
      imageUrl = json['images'][0],
      description = json['description'];
}
