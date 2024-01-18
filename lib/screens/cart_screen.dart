// screens/cart_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';
import '../models/product.dart';
import 'widgets/totalPrice.dart'; 

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  // ignore: use_key_in_widget_constructors
  const CartScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var allProducts = Provider.of<List<Product>>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFAF3F0),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cart',
            style: GoogleFonts.lato(
              color: Colors.white,
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
            return const SizedBox.shrink(); 
          }


          var product = allProducts.firstWhere((product) => product.id == cartItem.productId);


          String itemName = product.name;
          double itemPrice = product.price;
          int itemQuantity = cartItem.quantity;

          return ListTile(
            title: Text('$itemName (Qty: $itemQuantity)'),
            subtitle: Text('\$${itemPrice.toString()}'),
          );
        },
      ),
      bottomSheet: CartTotal(), // Use the CartTotal widget here
    );
  }
}
