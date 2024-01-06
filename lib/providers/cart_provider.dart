// cart_provider.dart
import 'package:flutter/foundation.dart';

class CartItem {
  final int productId;
  final int quantity;

   CartItem({required this.productId, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  final List<CartItem?> _items = [];

  List<CartItem?> get items => _items;

  void addItem(int productId) {
    var existingIndex = _items.indexWhere((item) => item?.productId == productId);

    if (existingIndex != -1) {
      
      _items[existingIndex] = CartItem(productId: productId, quantity: _items[existingIndex]!.quantity + 1);
    } else {
      
      _items.add(CartItem(productId: productId));
    }

    notifyListeners();
  }

  void removeItem(int productId) {
    _items.removeWhere((item) => item?.productId == productId);
    notifyListeners();
  }
}
