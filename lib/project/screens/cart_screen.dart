import 'package:flutter/material.dart';
import 'package:shopping_app/project/widgets/app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Cart',
      ),
      body: Center(
        child: Text("Cart Screen"),
      ),
    );
  }
}
