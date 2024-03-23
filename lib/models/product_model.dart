import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommended,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isPopular, isRecommended];

  static List<Product> products = [
    Product(
        name: 'Soft Drink #1',
        category: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1533007716222-4b465613a984?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 2.99,
        isPopular: false,
        isRecommended: true),
    Product(
        name: 'Soft Drink #2',
        category: 'Soft Drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1625740822008-e45abf4e01d5?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 2.99,
        isPopular: false,
        isRecommended: true),
    Product(
        name: 'Soft Drink #3',
        category: 'Soft Drinks',
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1675779426747-5b598895f9e5?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 2.99,
        isPopular: true,
        isRecommended: true),
    Product(
        name: 'Smoothie #1',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1553530666-ba11a7da3888?q=80&w=1372&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 2.99,
        isPopular: true,
        isRecommended: false),
    Product(
        name: 'Smoothie #2',
        category: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1610622930110-3c076902312a?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        price: 2.99,
        isPopular: false,
        isRecommended: true),
  ];
}
