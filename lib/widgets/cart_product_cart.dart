import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestux/blocs/cart/cart_bloc.dart';
import 'package:fluttertestux/blocs/cart/cart_event.dart';

import '../blocs/cart/cart_state.dart';
import '../models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;

  const CartProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Avenir')),
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Avenir'),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(CartProductRemoved(product));
                    },
                    icon: Icon(Icons.remove_circle)),
                Text(
                  '1',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Avenir'),
                ),
                IconButton(onPressed: () {
                  context.read<CartBloc>().add(CartProductAdded(product));
                }, icon: Icon(Icons.add_circle)),
              ],
            );
          })
        ],
      ),
    );
  }
}
