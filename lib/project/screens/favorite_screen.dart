import 'package:flutter/material.dart';
import 'package:shopping_app/project/widgets/app_bar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Favorites',
      ),
      body: Center(
        child: Text("Favorite Screen"),
      ),
    );
  }
}
