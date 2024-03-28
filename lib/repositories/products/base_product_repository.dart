import 'package:fluttertestux/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}