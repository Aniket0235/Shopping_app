import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String image;
  bool isFavorite;
  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image,
      this.isFavorite = false});

  void toogleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
