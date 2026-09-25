class ProductModel {
  final String title;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      price = json['price'].toDouble(),
      imageUrl = json['thumbnail'];
}

final List<ProductModel> products = [
  ProductModel(
    title: 'Phone',
    price: 250,
    imageUrl: "assets/images/images1.jpg",
  ),
  ProductModel(
    title: 'Tablet',
    price: 4050,
    imageUrl: "assets/images/images1.jpg",
  ),
  ProductModel(
    title: 'Laptop',
    price: 100020,
    imageUrl: "assets/images/images1.jpg",
  ),
];
