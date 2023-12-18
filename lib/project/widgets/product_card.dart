import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/project/common/colors.dart';
import 'package:shopping_app/project/models/product_model.dart';
import 'package:shopping_app/project/providers/favorite_provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFirst;

  const ProductCard({
    required this.product,
    this.isFirst = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: isFirst ? 0.0 : 8.0,
        right: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.borderColor),
      ),
      width: 170,
      height: 250,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Consumer(
              builder: (_, ref, __) {
                final isFavorite =
                    ref.watch(favoritesProvider).contains(product);
                return IconButton(
                  onPressed: () {
                    var favorites = ref.read(favoritesProvider.notifier);
                    if (isFavorite) {
                      favorites.removeFavorite(product);
                    } else {
                      favorites.addFavorite(product);
                    }
                  },
                  icon: Transform.scale(
                    scale: 1.2,
                    child: Icon(
                      color: AppColors.favoriteColor,
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    product.image,
                  ),
                ),
                const Spacer(),
                Text(
                  product.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),
                Text(
                  '${product.weight}${product.weightUnit.prefix}',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 0.1,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.secondary.withOpacity(0.7),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
