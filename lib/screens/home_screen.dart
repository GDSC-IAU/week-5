import 'package:flutter/material.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';
import '../data/product_data.dart';
import './widgets/AdBox.dart';
import './widgets/categorySelector.dart';
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
  List<String> selectedCategories = [];

  @override
  void initState() {
    super.initState();
    categories =
        allProducts.map((product) => product.category).toSet().toList();
  }

  void _performSearch(String query) {
    setState(() {
      displayedProducts = allProducts
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _onCategoriesSelected(List<String> selectedCategories) {
    setState(() {
      this.selectedCategories = selectedCategories;
      if (selectedCategories.isNotEmpty) {
        displayedProducts = allProducts
            .where((product) => selectedCategories.contains(product.category))
            .toList();
      } else {
        displayedProducts = allProducts;
      }
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
            Text(
              'Our Plants',
              style: GoogleFonts.lato(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF618264),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CategorySelector(
                allCategories: categories,
                onCategoriesSelected: _onCategoriesSelected,
              ),
            ),
            // Display products based on selectedCategories
            CategoryListView(
              category:
                  selectedCategories.isNotEmpty ? selectedCategories.first : '',
              categoryProducts: displayedProducts,
            ),
          ],
        ),
      ),
    );
  }
}
