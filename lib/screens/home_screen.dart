import 'package:flutter/material.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';
import '../screens/product_details_screen.dart';
import '../data/product_data.dart';
import './widgets/AdBox.dart';
import './widgets/CategoryListView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<String> categories;
  late List<Product> displayedProducts = allProducts;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    categories = allProducts.map((product) => product.category).toSet().toList();
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
      backgroundColor: const Color(0xFFFAF3F0),
      appBar: AppBar(
        toolbarHeight: 100,
        title: AnimationSearchBar(
          isBackButtonVisible: false,
          searchIconColor: Colors.white,
          searchFieldDecoration: BoxDecoration(
            color: const Color(0xFFD0E7D2),
            border: Border.all(color: Colors.black.withOpacity(.2), width: .5),
            borderRadius: BorderRadius.circular(15),
          ),
          centerTitle: 'Planty',
          centerTitleStyle: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          onChanged: _performSearch,
          searchTextEditingController: controller,
          searchBarWidth: MediaQuery.of(context).size.width - 50,
          horizontalPadding: 5,
          verticalPadding: 0,
        ),
        backgroundColor: const Color(0xFF618264),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AdBox(),
            for (String category in categories)
              ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  category,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF618264),
                  ),
                ),
                children: [
                  CategoryListView(
                    category: category,
                    categoryProducts: allProducts
                        .where((product) => product.category == category)
                        .toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
