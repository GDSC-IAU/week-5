import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class CartProvider extends ChangeNotifier {
  final List<product> _cart = [];
  List<product> get cart => _cart;

  // Add function
  void addToCart(product product) {
    // Check if the product is already in the cart
    if (!_cart.contains(product)) {
      _cart.add(product);
      notifyListeners();
    }
  }

  // Remove from cart
  void deleteCart(product product) {
    _cart.remove(product);
    notifyListeners();
  }
}
