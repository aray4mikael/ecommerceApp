import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestux/models/models.dart';

// Eventos
abstract class WishlistEvent {}

class AddWishlistProduct extends WishlistEvent {
  final Product product;

  AddWishlistProduct(this.product);
}

class RemoveWishlistProduct extends WishlistEvent {
  final Product product;

  RemoveWishlistProduct(this.product);
}

// Estado
class WishlistState {
  final List<Product> wishlist;

  WishlistState(this.wishlist);
}

// Bloc
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistState([])) {
    on<AddWishlistProduct>((event, emit) {
      if (!state.wishlist.contains(event.product)) {
        final List<Product> updatedWishlist = List.from(state.wishlist)..add(event.product);
        emit(WishlistState(updatedWishlist));
      }
    });

    on<RemoveWishlistProduct>((event, emit) {
      final List<Product> updatedWishlist = List.from(state.wishlist)..remove(event.product);
      emit(WishlistState(updatedWishlist));
    });
  }
}
