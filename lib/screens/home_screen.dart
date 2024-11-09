import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [

      Product(
        imageUrl: 'lib/assets/product_1.jpg',
        name: 'Product 1',
        price: 19.99,
        discount: 5.00,
      ),
      Product(
        imageUrl: 'lib/assets/product_2.jpg',
        name: 'Product 2',
        price: 24.99,
        discount: 0.00,
      ),
      // ... more products
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7, // Adjust this value to make cards taller or shorter
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final Product product = products[index];
            return ProductCard(
              imageUrl: product.imageUrl,
              name: product.name,
              price: product.price,
              discount: product.discount,
            );
          },
        ),
      ),
    );
  }
}