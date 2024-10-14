// TODO Implement this library.

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'lib/assets/3.jpg',
    title: 'Select Your Store',
    description:
    'Pick your preferred store from our list of trusted partners to view their specific deals',
  ),
  Slide(
    imageUrl: 'lib/assets/2.jpg',
    title: 'Explore Deals',
    description:
    'Checkout list of deals available for preferred store and choose what best for you',
  ),
  Slide(
    imageUrl: 'lib/assets/1.jpg',
    title: 'Enjoy Your Savings',
    description:
    'Purchase the items in your shopping list at your favorite desi stores to save money',
  ),
];
