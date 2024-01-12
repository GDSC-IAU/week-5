import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class DetailsPage extends StatelessWidget {
  final product;
  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                // Navigating to the cart page using the named route
                Navigator.pushNamed(context, '/cart');
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 330,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color:
                        const Color.fromARGB(255, 65, 65, 65).withOpacity(0.1)),
                child: Image.asset(product.image, fit: BoxFit.cover),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 22),
                    ),
                    Text(
                      '\$ ' '${product.price}',
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity, // Full width of the container
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 43, 102, 46),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        cartProvider.addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item added to the cart'),
                            behavior: SnackBarBehavior
                                .floating, // Set behavior to floating
                            duration: Duration(
                                seconds:
                                    2), // Optional: Set the duration for how long the SnackBar will be displayed
                          ),
                        );
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
