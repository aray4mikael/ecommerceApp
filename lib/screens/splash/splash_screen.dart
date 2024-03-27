import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertestux/models/models.dart';
import 'package:fluttertestux/widgets/widgets.dart';

import '../../models/category_model.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';

  // const CatalogScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/images/logo.png', width: 125, height: 125,),
          )
        ],
      ),
    );
  }
}
