import 'package:equatable/equatable.dart';
import 'package:fluttertestux/models/product_model.dart';

class Cart extends Equatable {
  Cart();

  double get subtotal => products.fold(0, (total, current) => total + current.price);


  double deliveryFee(subtotal){
    if (subtotal >= 30.0){
      return 0.0;
    } else{
      return 10.0;
    }
  }

  double total(subtotal, deliveryFee){
    return subtotal + deliveryFee(subtotal);
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0){
      return 'You have Free Delivery';
    }
    else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);


  List<Product> products = [
    Product(
      name: 'Skate',
      category: 'Smoothies',
      imageUrl: 'https://images.unsplash.com/photo-1536318431364-5cc762cfc8ec?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 12.90,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      name: 'Sword',
      category: 'Soft Drinks',
      imageUrl: 'https://images.unsplash.com/photo-1440711085503-89d8ec455791?q=80&w=1398&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 8.90,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      name: 'Glasses',
      category: 'Soft Drinks',
      imageUrl: 'https://images.unsplash.com/photo-1540162875225-3f6b56d69fe8?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      price: 18.90,
      isRecommended: false,
      isPopular: true,
    ),
  ];



  @override
  List<Object?> get props => [];
}