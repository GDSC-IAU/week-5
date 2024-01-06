// home_screen.dart
import 'package:flutter/material.dart';
import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:google_fonts/google_fonts.dart';


import '../models/product.dart';
import '../screens/product_details_screen.dart';
import '../data/product_data.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
      backgroundColor: const Color(0xFFD0E7D2),
      appBar: AppBar(
        toolbarHeight: 100,
        title: AnimationSearchBar(
          isBackButtonVisible: false,
          searchIconColor: const Color(0xFFD0E7D2),
          searchFieldDecoration:BoxDecoration(
          color: const Color(0xFFD0E7D2),
          border: Border.all(color: Colors.black.withOpacity(.2), width: .5),
          borderRadius: BorderRadius.circular(15)),
          centerTitle: 'Planty',
          centerTitleStyle: GoogleFonts.lato(
            color: const Color(0xFFD0E7D2),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
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
                    height: 150.0,
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
                    color: Color(0xFF618264),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
),

    );
  }
}
