import 'package:flutter/material.dart';
import 'package:shopping_app/project/widgets/app_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Explore',
      ),
      body: Center(
        child: Text("Explore Screen"),
      ),
    );
  }
}
