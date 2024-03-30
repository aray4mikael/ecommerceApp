import 'package:equatable/equatable.dart';

import '../../models/category_model.dart';
import '../../models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}
class ProductLoading extends ProductState {}
class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded({this.products = const <Product>[]});
  @override
  List<Object> get props => [products];
}
class ProductError extends ProductState {
  final String message;
  ProductError({required this.message});
  @override
  List<Object> get props => [message];
}