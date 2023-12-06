import 'package:flutter/material.dart';
import 'package:shopping_app/MainScreen.dart';

void main() {
  runApp(const MainApp());
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
