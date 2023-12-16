import 'package:flutter/material.dart';
import 'package:shopping_app/project/common/colors.dart';
import 'package:shopping_app/project/screens/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      theme: getTheme(),
      routes: {
        "/main": (context) => const MainScreen(),
      },
    );
  }

  ThemeData getTheme() {
    ThemeData themeData = ThemeData.light();
    return themeData.copyWith(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: themeData.colorScheme.copyWith(
        primary: AppColors.secondary,
      ),
      bottomNavigationBarTheme: themeData.bottomNavigationBarTheme.copyWith(
        unselectedItemColor: AppColors.primary,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
      ),
    );
  }
}
