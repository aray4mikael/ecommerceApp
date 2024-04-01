import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertestux/blocs/product/product_bloc.dart';
import 'package:fluttertestux/blocs/product/product_state.dart';
import 'package:fluttertestux/models/models.dart';
import 'package:fluttertestux/widgets/widgets.dart';
import 'package:fluttertestux/config/theme.dart';

import '../../blocs/category/category_bloc.dart';
import '../../blocs/category/category_state.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Zero to Unicorn'),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CategoryLoaded) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      enableInfiniteScroll: false,
                    ),
                    items: state.categories
                        .map((category) => HeroCarouselCard(category: category))
                        .toList(),
                  );
                }
                if (state is CategoryError) {
                  return Text(state.message);
                }
                return Text('Something Went wrong');
              },
            ),
            SectionTitle(title: 'RECOMENDADOS'),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductError) {
                return Text(state.message);
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isRecommended)
                      .toList(),
                );
              } else {
                return Text('Something went wrong');
              }
            }),
            SectionTitle(title: 'POPULARES'),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ProductError) {
                return Text(state.message);
              }
              if (state is ProductLoaded) {
                return ProductCarousel(
                  products: state.products
                      .where((product) => product.isPopular)
                      .toList(),
                );
              } else {
                return Text('Something went wrong');
              }
            }),
          ],
        ),
      ),
    );
  }
}
