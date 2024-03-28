import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({required this.name, required this.imageUrl});

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(
        name: 'Soft Drinks',
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1676136253656-45f5a10e283c?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Category(
        name: 'Smoothies',
        imageUrl:
            'https://images.unsplash.com/photo-1505252585461-04db1eb84625?q=80&w=1416&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    Category(
        name: 'Water',
        imageUrl:
            'https://media.istockphoto.com/id/866929570/pt/foto/closeup-on-mineral-water-bottles-in-raw-and-lines.jpg?s=1024x1024&w=is&k=20&c=2BjzkFHNPHjVOtWuQcL4qaWPjBzWviE_4W0voFsX7yk=')
  ];
}
