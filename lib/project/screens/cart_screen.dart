import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/project/common/functions.dart';
import 'package:shopping_app/project/models/product_model.dart';
import 'package:shopping_app/project/providers/cart_provider.dart';
import 'package:shopping_app/project/widgets/app_bar.dart';
import 'package:shopping_app/project/widgets/buttons/custom_button.dart';
import 'package:shopping_app/project/widgets/cart_tile.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<Product, int> cartItems = ref.watch(cartProvider);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Cart',
        border: true,
        cartIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: cartItems.isNotEmpty ? _buildView(cartItems) : _buildEmptyView(),
      ),
    );
  }

  Widget _buildEmptyView() {
    return const Center(
      child: Text(
        'There is no items in your cart',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildView(Map<Product, int> products) {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: (_, index) {
            final product = products.keys.elementAt(index);
            var cartTile = CartTile(
              product: product,
              pieces: products[product]!,
            );
            return index + 1 == products.length
                ? Column(
                    children: [
                      cartTile,
                      kH(80),
                    ],
                  )
                : cartTile;
          },
          shrinkWrap: true,
          itemCount: products.length,
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(15),
          child: CustomButton(
            onPressed: () {},
            title: 'Go to Checkout'
          ),
        ),
      ],
    );
  }
}
