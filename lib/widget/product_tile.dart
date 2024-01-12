import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class ProductTile extends StatefulWidget {
  final product product0; //insntce of the proudect class in product.dart
  const ProductTile({super.key, required this.product0});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width / 2;
    return Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Color.fromARGB(255, 65, 65, 65).withOpacity(0.1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: containerWidth,
            child: Image.asset(
              widget.product0.image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(8),
              width: containerWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.product0.name),
                  Text(
                    '\$${widget.product0.price}',
                    style: TextStyle(color: Color.fromARGB(255, 43, 102, 46)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
