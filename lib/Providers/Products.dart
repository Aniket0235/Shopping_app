import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      void _favValue(bool newValue){
        isFavorite=newValue;
        notifyListeners();
      }

  Future<void> toogleFavoriteStatus() async {
    final oldFav = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        'https://aniket-59522-default-rtdb.firebaseio.com/products/$id.json');
    try {
      final respo =
          await http.patch(url, body: json.encode({'isFavorite': isFavorite}));
      if (respo.statusCode >= 400) {
        _favValue(oldFav);
      }
    } catch (error) {
       _favValue(oldFav);
    }
  }
}
