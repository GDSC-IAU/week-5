import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/project/common/colors.dart';
import 'package:shopping_app/project/models/product_model.dart';
import 'package:shopping_app/project/providers/product_provider.dart';
import 'package:shopping_app/project/widgets/app_bar.dart';
import 'package:shopping_app/project/widgets/product_card.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(productsProvider.notifier);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Explore Products',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearchBar(),
              const SizedBox(
                height: 20,
              ),
              _buildBanner(),
              const SizedBox(
                height: 5,
              ),
              _buildSection(
                title: 'Exclusive Offer',
                route: '/category/offers',
                products: provider.getCategory(ProductCategory.exclusive),
              ),
              const SizedBox(
                height: 5,
              ),
              _buildSection(
                title: 'Fruits',
                route: '/category/fruits',
                products: provider.getCategory(ProductCategory.fruits),
              ),
              const SizedBox(
                height: 5,
              ),
              _buildSection(
                  title: 'Vegetables',
                  route: '/category/vegetables',
                  products: provider.getCategory(ProductCategory.vegetables)),
              const SizedBox(
                height: 5,
              ),
              _buildSection(
                title: 'Beverages',
                route: '/category/beverages',
                products: provider.getCategory(ProductCategory.beverages),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.bg0, borderRadius: BorderRadius.circular(15)),
      child: LayoutBuilder(builder: (_, constraints) {
        return Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.75,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search Store',
                  alignLabelWithHint: true,
                ),
                onChanged: (value) {},
                readOnly: true,
              ),
            )
          ],
        );
      }),
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      width: double.infinity,
      height: 115,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assets/images/banner.jpg',
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  _buildSection({
    required String title,
    required String route,
    required List<Product> products,
    int minimum = 4,
  }) {
    return products.isEmpty
        ? const SizedBox()
        : SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        animationDuration: Duration(milliseconds: 0),
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'See all',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 250,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => ProductCard(
                        product: products[index],
                        isFirst: index == 0,
                      ),
                      shrinkWrap: true,
                      itemCount: min(minimum, products.length),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
