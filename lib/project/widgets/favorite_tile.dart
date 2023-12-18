import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/project/common/colors.dart';
import 'package:shopping_app/project/models/product_model.dart';
import 'package:shopping_app/project/providers/favorite_provider.dart';

class FavoriteTile extends ConsumerWidget {
  final Product product;

  const FavoriteTile({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor),
        ),
      ),
      child: Dismissible(
        onDismissed: (direction) {
          var favorites = ref.read(favoritesProvider.notifier);
          favorites.removeFavorite(product);
        },
        key: Key(product.title),
        direction: DismissDirection.endToStart,
        resizeDuration: const Duration(milliseconds: 25),
        background: _dismissibleBackground(),
        child: ListTile(
          splashColor: Colors.blueGrey.shade50,
          onTap: () {},
          leading: SizedBox(
            height: 70,
            width: 70,
            child: Image.asset(product.image, fit: BoxFit.scaleDown),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
            ),
          ),
          subtitle: Text(
            '${product.weight}${product.weightUnit.prefix}',
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.1,
            ),
          ),
          trailing: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Text(
                '\$${product.price}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              const SizedBox(
                width: 8,
                height: 14,
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _dismissibleBackground() {
    return Container(
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete, color: Colors.white),
              SizedBox(
                width: 8.0,
              ),
              Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
  }
}
