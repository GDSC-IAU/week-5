// home_screen.dart
import 'package:flutter/material.dart';
import 'package:animation_search_bar/animation_search_bar.dart';

import '../models/product.dart';
import '../screens/product_details_screen.dart';
import '../data/product_data.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> displayedProducts;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedProducts = List.from(allProducts);
  }

  void _performSearch(String query) {
    setState(() {
      displayedProducts = allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimationSearchBar(
          isBackButtonVisible: false,
          backIconColor: Colors.black,
          centerTitle: 'App Title',
          onChanged: _performSearch,
          searchTextEditingController: controller,
          searchFieldHeight: 35,
          searchBarHeight: 50,
          searchBarWidth: MediaQuery.of(context).size.width - 50,
          horizontalPadding: 5,
          verticalPadding: 0,
        ),
      ),


      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: displayedProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: displayedProducts[index]),
                ),
              );
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        displayedProducts[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      displayedProducts[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
