import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';


class CartProvider extends ChangeNotifier {
  final List<product> _cart = [];
  List<product> get cart => _cart;

  //add function
  void addToCart(product product) {
    _cart.add(product);
    notifyListeners();
  }

  //remove from cart
  void deleteCart(product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
