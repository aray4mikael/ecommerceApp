import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestux/blocs/product/product_event.dart';
import 'package:fluttertestux/blocs/product/product_state.dart';
import 'package:fluttertestux/repositories/products/product_repository.dart';

import '../../models/product_model.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProducts>(_mapLoadProductsToState);
  }
  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is UpdateProducts) {
      yield* _mapUpdateProductsToState(event);
    }
  }
  void _mapLoadProductsToState(LoadProducts event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoading());
      final productsStream = _productRepository.getAllProducts();
      final products = await productsStream.first;
      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: 'Failed to load products: $e'));
    }
  }
  Stream<ProductState> _mapUpdateProductsToState(
      UpdateProducts event) async* {
    yield ProductLoaded(products: event.products);
  }
}
