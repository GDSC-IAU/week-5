import 'package:flutter/material.dart';
// Import all of the pages that we want to navigate to
// ...............

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _pages = [
    // Add all of the pages that we want to navigate to
    // ...............
    Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    ),
    Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: const Center(
        child: Text('Search'),
      ),
    ),
    Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Text('Cart'),
      ),
    ),
    Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile'),
      ),
    ),
  ];

  // Create a variable to keep track of the current page
  int _selectedPageIndex = 0;

  // Create a method to change the current page
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Create a scaffold
    return Scaffold(
      // Create a bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        // Set the current page
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        // Set the items in the bottom navigation bar
        items: const [
          // Create a bottom navigation bar item
          BottomNavigationBarItem(
            // Set the icon of the item
            icon: Icon(Icons.home),
            // Set the label of the item
            label: 'Home',
          ),
          // Create a bottom navigation bar item
          BottomNavigationBarItem(
            // Set the icon of the item
            icon: Icon(Icons.search),
            // Set the label of the item
            label: 'Search',
          ),
          // Create a bottom navigation bar item
          BottomNavigationBarItem(
            // Set the icon of the item
            icon: Icon(Icons.shopping_cart),
            // Set the label of the item
            label: 'Cart',
          ),
          // Create a bottom navigation bar item
          BottomNavigationBarItem(
            // Set the icon of the item
            icon: Icon(Icons.person),
            // Set the label of the item
            label: 'Profile',
          ),
        ],
        // Set the action that happens when an item is pressed
        onTap: _selectPage,
      ),
      // Set the body of the scaffold
      body: _pages[_selectedPageIndex],
    );
  }
}
