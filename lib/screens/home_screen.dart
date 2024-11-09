import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';
import 'purchase_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> cartItems = [];

  void addToCart(Product product) {
    setState(() {
      final existingItem = cartItems.firstWhere(
            (item) => item.imageUrl == product.imageUrl,
        orElse: () => product,
      );

      if (cartItems.contains(existingItem)) {
        existingItem.quantity++;
      } else {
        cartItems.add(product);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void navigateToPurchase(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PurchaseScreen(
          products: [product],
          totalAmount: product.totalPrice,
          onPlaceOrder: () {
            // Implement order placement logic here
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Order placed successfully!'),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        imageUrl: 'lib/assets/groceries/mangoes.jpg',
        name: 'Mangoes',
        price: 19.99,
        discount: 0.00,
      ),
      Product(
        imageUrl: 'lib/assets/groceries/Red-raspberries.jpg',
        name: 'Product 2',
        price: 24.99,
        discount: 0.00,
      ),
      Product(
        imageUrl: 'lib/assets/groceries/apples.jpg',
        name: 'Apples',
        price: 24.99,
        discount: 0.00,
      ),
      Product(
        imageUrl: 'lib/assets/groceries/bananas.jpeg',
        name: 'Bananas',
        price: 24.99,
        discount: 0.00,
      ),
      Product(
        imageUrl: 'lib/assets/groceries/tomatoes.jpg',
        name: 'Tomatoes',
        price: 24.99,
        discount: 0.00,
      ),
      Product(
        imageUrl: 'lib/assets/groceries/oranges.jpg',
        name: 'Product 2',
        price: 24.99,
        discount: 0.00,
      ),
      Product(
        imageUrl: 'lib/assets/groceries/strawberry.jpg',
        name: 'Product 2',
        price: 24.99,
        discount: 0.00,
      ),
      // ... more products
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartItems: cartItems,
                    onPlaceOrder: () {
                      // Implement order placement logic here
                      Navigator.pop(context);
                      setState(() {
                        cartItems.clear();
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Order placed successfully!'),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final Product product = products[index];
            return ProductCard(
              product: product,
              onAddToCart: () => addToCart(product),
              onBuyNow: () => navigateToPurchase(product),
            );
          },
        ),
      ),
    );
  }
}