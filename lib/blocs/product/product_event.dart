import 'package:equatable/equatable.dart';

import '../../models/category_model.dart';
import '../../models/product_model.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  @override
  List<Object> get props => [];
}
class LoadProducts extends ProductEvent {}
class UpdateProducts extends ProductEvent {
  final List<Product> products;
  UpdateProducts(this.products);
  @override
  List<Object> get props => [products];
}