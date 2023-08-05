class Product {
  final int id;
  final String title;
  final double price;
  final String brand;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      brand: json['brand'],
      category: json['category'],
      image: json['images'][0],
    );
  }
}
