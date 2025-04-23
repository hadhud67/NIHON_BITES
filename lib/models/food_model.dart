class Food {
  final String name;
  final String image;
  final String description;
  final double price;
  final double rating;
  int quantity;

  Food({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
    this.quantity = 1,
  });

  Food copyWith({int? quantity}) {
    return Food(
      name: name,
      image: image,
      description: description,
      price: price,
      rating: rating,
      quantity: quantity ?? this.quantity,
    );
  }
}