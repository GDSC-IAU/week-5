import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  // ignore: use_key_in_widget_constructors
  const CartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var allProducts = Provider.of<List<Product>>(context);

    // Calculate total price
    double totalPrice = cartProvider.items
        .map((cartItem) {
          if (cartItem != null) {
            var product = allProducts.firstWhere((product) => product.id == cartItem.productId);
            return product.price;
          }
          return 0.0;
        })
        .fold(0.0, (previousValue, currentValue) => previousValue + currentValue);

    return Scaffold(
      backgroundColor: const Color(0xFFD0E7D2),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cart',
            style: GoogleFonts.lato(
              color: const Color(0xFFD0E7D2),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF618264),
      ),
      body: ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          var cartItem = cartProvider.items[index];

          if (cartItem == null) {
            return const SizedBox.shrink(); // Skip rendering if item is null
          }

          // Find the corresponding product using the productId
          var product = allProducts.firstWhere((product) => product.id == cartItem.productId);

          // Now you can access the properties like name and price
          String itemName = product.name ;
          double itemPrice = product.price ;
          int itemQuantity = cartItem.quantity;

          // You can customize the appearance of each cart item here
          return ListTile(
            title: Text('$itemName (Qty: $itemQuantity)'),
            subtitle: Text('\$${itemPrice.toString()}'),
          );
        },
      ),
      bottomSheet: Container(
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
      ),
    );
  }
}
