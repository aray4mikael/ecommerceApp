import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestux/blocs/cart/cart_bloc.dart';
import 'package:fluttertestux/blocs/wishlist/wishlist_bloc.dart';
import 'package:fluttertestux/config/app_router.dart';
import 'package:fluttertestux/config/theme.dart';
import 'package:fluttertestux/screens/screens.dart';

import 'blocs/cart/cart_event.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(
          create: (context) => WishlistBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc()..add(CartStarted()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero to Unicorn',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
