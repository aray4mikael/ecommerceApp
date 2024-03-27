import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestux/blocs/cart/cart_event.dart';

import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_state.dart';
import '../blocs/wishlist/wishlist_bloc.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishListed;

  const ProductCard(
      {super.key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 5,
      this.isWishListed = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: product,
        );
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor -
                  leftPosition,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: MediaQuery.of(context).size.width / widthFactor -
                  10 -
                  leftPosition,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Avenir'),
                          ),
                          Text(
                            '${product.price}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Avenir'),
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                      if (state is CartLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CartLoaded) {
                        return Expanded(
                            child: IconButton(
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(CartProductAdded(product));
                          },
                        ));
                      } else {
                        return Text('Something went wrong.');
                      }
                    }),
                    isWishListed
                        ? Expanded(
                            child: IconButton(
                                onPressed: () {
                                  context
                                      .read<WishlistBloc>()
                                      .add(RemoveWishlistProduct(product));
                                  final snackBar = SnackBar(
                                      content:
                                          Text('Removed to your Wishlist'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
