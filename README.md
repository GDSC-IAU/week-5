# Week 5: Introduction to Pub.dev/Page Navigation

## Overview

This week we will be learning about how to use the pub.dev website to find packages that we can use in our apps. We will also be learning about how to navigate between pages in our apps.

## Objectives

- Learn how to use the pub.dev website to find packages that we can use in our apps
- Learn how to navigate between pages in our apps
- Learn how to use the `Navigator` widget to navigate between pages
- Learn how to use the `MaterialPageRoute` widget to navigate between pages
- Learn how to use the `Navigator.push` method to navigate between pages

## Resources

- [pub.dev](https://pub.dev/)
- [Navigator](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
- [MaterialPageRoute](https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html)
- [bottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html)
- Example Design Packages:
  - [Flutter Awesome](https://flutterawesome.com/)
  - [Slider](https://pub.dev/packages/flutter_xlider)
  - [Cards](https://pub.dev/packages/card_swiper)
  - [Payment](https://pub.dev/packages/flutter_credit_card)

## Project Overview

This week we will be creating a new E-Commerce app. We will be using the `Navigator` widget to navigate between pages in our app. We will also be using the `MaterialPageRoute` widget to navigate between pages in our app. We will also be using the `Navigator.push` method to navigate between pages in our app.

## Important Concepts

### Setting up a bottom navigation bar

```dart
import 'package:flutter/material.dart';
// Import all of the pages that we want to navigate to
// ...............

// Create a stateful widget
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  _MainScreenState createState() => _MainScreenState();
}

// Create a state
class _MainScreenState extends State<MainScreen> {
  // Create a list of pages that we want to navigate to
  final List<Widget> _pages = [
    // Add all of the pages that we want to navigate to
    // ...............
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
        // Set the items in the bottom navigation bar
        items: [
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
```

This is what the bottom navigation bar will look like:

![Alt text](/readmeAssets/image.png?raw=true "Bottom Navigation Bar")

You can also use different packages provided in pub.dev to create a stylized bottom navigation bar.

### Navigating to a new page

#### Using the Navigator Widget

```dart
import 'package:flutter/material.dart';
// Import the page that we want to navigate to
// ...............

// Navigate Function using Push
void _navigate(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SomePage(args: args,)// Add the page that we want to navigate to
    ),
  );
}
```

#### Using Named Routes

```dart
import 'package:flutter/material.dart';
// Import all of the pages that we want to navigate to
// ...............

// In your MaterialApp widget, add the routes parameter
MaterialApp(
  // Add the routes parameter
  routes: {
    // Add all of the pages that we want to navigate to
    // ...............
    "/somePage": (context) => SomePage(args: args),// Add the page that we want to navigate to
    "/someOtherPage": (context) => SomeOtherPage(args: args),// Add the page that we want to navigate to
  },
);
```

Now we can navigate to a new page using the following code:

```dart
// Navigate Function using Named Routes
void _navigate(BuildContext context) {
  Navigator.pushNamed(
    context,
    '/somePage',// Add the name of the page that we want to navigate to
  );
}
```

## Task: Create a new E-Commerce App

This week we will be creating a new E-Commerce app. The design of the app is up to you, however it must fall within the following requirements:

### Requirements

- The app must use providers to provide data to the pages (The type of provider is up to you)
- The app must have a bottom navigation bar
- The app must have at least 3 pages
- The app must have at least 1 page that uses a `MaterialPageRoute` to navigate to it (ex, Product details).
- The app must have at least 1 page that uses the `Navigator.push` method to navigate to it (ex, Cart).
- The app must have at least 1 page that uses a `NamedRoute` to navigate to it (ex, Profile).

### Bonus

- Use a package from pub.dev to create a stylized bottom navigation bar
- Use a Hero widget to create a transition between pages

### Design Inspiration

#### Designs

- [Grocery App 1 Figma Link](https://www.figma.com/community/file/882645007956337261)
  - ![Grocery App Design 1](/readmeAssets/design-1.png)
- [E-Commerce App Figma Link](https://www.figma.com/community/file/1235854850814701017)
  - ![E-Commerce App Design 2](/readmeAssets/design-2.png)
- [Veggie E-Commerce App Link](https://www.figma.com/community/file/1137619395050980999)
  - ![Veggie E-Commerce Design 3](/readmeAssets/design-3.png)
