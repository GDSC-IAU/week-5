import 'package:flutter/material.dart';
import 'package:shopping_app/Pages/detailsPage.dart';
import 'package:shopping_app/models/product_list.dart';
import 'package:shopping_app/widget/product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Our Products'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: _buildAllProducts(),
        ));
  }
}

_buildAllProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 130),
        crossAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: ProductsList.allProducts.length,
      itemBuilder: (context, index) {
        final allProduct = ProductsList.allProducts[index];
        return GestureDetector(
          onTap: () => Navigator.push(
              // Navigator.push
              context,
              MaterialPageRoute(
                  //use a MaterialPageRoute
                  builder: (context) => DetailsPage(product: allProduct))),
          child: ProductTile(product0: allProduct),
        );
      },
    );
