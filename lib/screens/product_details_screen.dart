
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF3F0),
      appBar: AppBar(
        title: Text(
                product.name,
                style: GoogleFonts.lato(
                color: const Color(0xFFD0E7D2),
                fontSize: 30,
                fontWeight: FontWeight.bold,
               ),
              ),
        backgroundColor: const Color(0xFF618264),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            

            //product image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: const Color(0xFF618264),
                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),


            const SizedBox(
              height: 16, 
              width: double.infinity,),

            //product name
            Center(
              child: Text(
                product.name,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF618264),
                ),
              ),
            ),

            //product price
            const SizedBox(height: 8),
            
            Center(
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF618264),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'price: ${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),


            //description
            Text(
              product.description,
              style: GoogleFonts.lato(
                fontSize: 16,
                color: const Color(0xFF618264),
              ),
            ),
            const SizedBox(height: 16),

            //add to cart button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF79AC78),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                 onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addItem(product.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart'),
                      duration: Duration(seconds: 1),
                    ),
                  );

                  // Navigate to the CartScreen
                  Navigator.push(
                  context,
                   MaterialPageRoute(
                   builder: (context) => const CartScreen(),
                   ),
                 );

                },
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}