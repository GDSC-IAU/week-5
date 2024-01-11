import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required product product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nameOf the Product'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
