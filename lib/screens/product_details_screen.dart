
import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //product image
            Image.asset(
              product.imageUrl,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            //product name
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            //product id
            const SizedBox(height: 8),
            Text(
              'ID: ${product.id}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),


            //description
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}