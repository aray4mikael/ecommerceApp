import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestux/blocs/cart/cart_event.dart';
import 'package:fluttertestux/blocs/cart/cart_state.dart';
import '../../models/cart_model.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    // Registrar o manipulador de evento para CartStarted
    on<CartStarted>((event, emit) async {
      emit(CartLoading());
      try {
        await Future<void>.delayed(Duration(seconds: 1));
        // Supondo que você faça algum carregamento aqui
        emit(CartLoaded());
      } catch (_) {
        emit(CartError());
      }
    });

    // Registrar o manipulador de evento para CartProductAdded
    on<CartProductAdded>((event, emit) {
      if (state is CartLoaded) {
        try {
          final currentState = state as CartLoaded;
          final updatedCart = Cart(
            products: List.from(currentState.cart.products)..add(event.product),
          );
          emit(CartLoaded(cart: updatedCart));
        } catch (_) {
          emit(CartError());
        }
      }
    });

    // Registrar o manipulador de evento para CartProductRemoved
    on<CartProductRemoved>((event, emit) {
      if (state is CartLoaded) {
        try {
          final currentState = state as CartLoaded;
          final updatedCart = Cart(
            products: List.from(currentState.cart.products)..remove(event.product),
          );
          emit(CartLoaded(cart: updatedCart));
        } catch (_) {
          emit(CartError());
        }
      }
    });
  }
}
