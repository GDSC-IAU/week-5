// screens/home_screen.dart
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../screens/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> allProducts = [
    Product(id: 1, name: 'Product 1', imageUrl: 'assets/product1.jpg'),
    Product(id: 2, name: 'Product 2', imageUrl: 'assets/product2.jpg'),
    Product(id: 3, name: 'Product 3', imageUrl: 'assets/product3.jpg'),
    // Add more products as needed
  ];

  late List<Product> displayedProducts;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedProducts = List.from(allProducts);
  }

  void _performSearch(String query) {
    setState(() {
      displayedProducts = allProducts
          .where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search Products',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                searchController.clear();
                _performSearch('');
              },
            ),
          ),
          onChanged: _performSearch,
        ),
      ),
      body: ListView.builder(
        itemCount: displayedProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: displayedProducts[index]),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(displayedProducts[index].name),
                leading: Image.asset(
                  displayedProducts[index].imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
