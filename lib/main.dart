import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertestux/blocs/cart/cart_bloc.dart';
import 'package:fluttertestux/blocs/category/category_event.dart';
import 'package:fluttertestux/blocs/product/product_bloc.dart';
import 'package:fluttertestux/blocs/product/product_event.dart';
import 'package:fluttertestux/blocs/wishlist/wishlist_bloc.dart';
import 'package:fluttertestux/config/app_router.dart';
import 'package:fluttertestux/config/theme.dart';
import 'package:fluttertestux/repositories/category/category_repository.dart';
import 'package:fluttertestux/repositories/products/product_repository.dart';
import 'package:fluttertestux/screens/screens.dart';
import 'firebase_options.dart';
import 'blocs/cart/cart_event.dart';
import 'blocs/category/category_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<WishlistBloc>(
          create: (context) => WishlistBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider<CategoryBloc>(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider<ProductBloc>(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
