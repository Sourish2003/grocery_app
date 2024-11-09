class Product {
  final String imageUrl;
  final String name;
  final double price;
  final double discount;
  int quantity; // For cart

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.discount,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}