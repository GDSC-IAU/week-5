import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';

import 'models/product.dart';

import '../data/product_data.dart';

import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        Provider<List<Product>>(create: (_) => allProducts),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-commerce app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Directionality(
        textDirection: TextDirection.ltr,
        child: MyHomePage(title: 'circular_bottom_navigation'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;
  late CircularBottomNavigationController _navigationController;

  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "Home",
      const Color(0xFF618264),
      labelStyle: const TextStyle(
        color: Color(0xFF618264),
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.shopping_cart,
      "Cart",
      const Color(0xFF618264),
      labelStyle: const TextStyle(
        color: Color(0xFF618264),
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.person,
      "Profile",
      const Color(0xFF618264),
      circleStrokeColor: Colors.white,
      labelStyle: const TextStyle(
        color: Color(0xFF618264),
        fontWeight: FontWeight.bold,
      ),
    ),
  ]);

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            child: bodyContainer(),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CartScreen();
      case 2:
        return const ProfileScreen();
      default:
        return Container();
    }
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      selectedPos: selectedPos,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      backgroundBoxShadow: const <BoxShadow>[
        BoxShadow(color: Colors.black45, blurRadius: 10.0),
      ],
      animationDuration: const Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
