import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertestux/models/models.dart';
import 'package:fluttertestux/widgets/widgets.dart';

import '../../models/category_model.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  // const CatalogScreen({super.key});

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('products').where('category', isEqualTo: category.name).snapshots(), // Query para buscar os produtos da categoria
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List<Product> categoryProducts = snapshot.data!.docs.map((doc) => Product.fromSnapshot(doc)).toList(); // Converter os documentos em objetos Product

          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.15,
            ),
            itemCount: categoryProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard(
                  product: categoryProducts[index],
                  widthFactor: 2.2,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
