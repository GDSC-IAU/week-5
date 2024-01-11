import 'package:flutter/material.dart';
import 'package:shopping_app/Pages/detailsPage.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/models/product_list.dart';
import 'package:shopping_app/widget/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Our Products'), centerTitle: true),
      body: _buildAllProducts(),
    );
  }
}

_buildAllProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: ProductsList.allProducts.length,
      itemBuilder: (context, index) {
        final allProduct = ProductsList.allProducts[index];
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(product: allProduct))),
          child: ProductTile(product0: allProduct),
        );
      },
    );