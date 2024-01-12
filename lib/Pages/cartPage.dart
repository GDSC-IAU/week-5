import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: Column(
        children: [
          Center(
            child: Visibility(
                visible: cartProvider.cart.isEmpty,
                child: const Text('You haven\'t added any products yet')),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cartProvider.cart.length,
                  itemBuilder: (BuildContext context, int index) {
                    product cartProduct = cartProvider.cart[index];
                    return Padding(
                        padding: EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(
                            cartProduct.name,
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            '\$' '${cartProduct.price}',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 43, 102, 46),
                                fontSize: 16),
                          ),
                          leading: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color.fromARGB(255, 65, 65, 65)
                                  .withOpacity(0.1),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(cartProduct.image),
                              ),
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                cartProvider.deleteCart(cartProduct);
                              },
                              icon: Icon(Icons.delete)),
                        ));
                  })),
          Container(
            padding: EdgeInsets.all(17),
            child: const Row(children: [
              Text(
                'Total',
                style: TextStyle(
                    color: Color.fromARGB(
                      255,
                      65,
                      65,
                      65,
                    ),
                    fontSize: 18),
              ),
              SizedBox(width: 255),
              Text(
                '\$0000',
                style: TextStyle(fontSize: 18),
              ),
            ]),
          ),
          Container(
              width: double.infinity, // Full width of the container
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 43, 102, 46),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: const Text(
                    'buy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}
