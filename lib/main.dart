import 'package:flutter/material.dart';
import 'package:shopping_app/MainScreen.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

void main() {
  ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping App",
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      routes: {
        "/main": (context) => const MainScreen(),
      },
    );
  }
}
