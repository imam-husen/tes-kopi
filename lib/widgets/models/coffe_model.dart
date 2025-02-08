class CoffeeModel {
  final String name;
  final String imageURL;
  final String type;
  final String category;
  final double rating;
  final String description;
  final String size;
  final double price;

  CoffeeModel({
    required this.name,
    required this.imageURL,
    required this.type,
    required this.category,
    required this.rating,
    required this.description,
    required this.size,
    required this.price,
  });

  factory CoffeeModel.fromFirestore(Map<String, dynamic> data) {
    print("Mapping Firestore Data: $data"); // Tambahkan log
    return CoffeeModel(
      name: data['name'] ?? '',
      imageURL: data['imageURL'] ?? '',
      type: data['type'] ?? '',
      category: data['category'] ?? '',
      rating: (data['rating'] ?? 0).toDouble(),
      description: data['description'] ?? '',
      size: data['size'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
    );
  }
}
