// screens/cart_total.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../models/product.dart';

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var allProducts = Provider.of<List<Product>>(context);

    // Calculate total price
    double totalPrice = cartProvider.items
        .map((cartItem) {
          if (cartItem != null) {
            var product = allProducts.firstWhere((product) => product.id == cartItem.productId);
            return product.price * cartItem.quantity;
          }
          return 0.0;
        })
        .fold(0.0, (previousValue, currentValue) => previousValue + currentValue);

    return Container(
      color: const Color(0xFF618264),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Total:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            '\$${totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
