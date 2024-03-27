import 'package:equatable/equatable.dart';
import 'package:fluttertestux/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

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



  @override
  List<Object?> get props => [products];
}