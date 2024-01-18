import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  final List<String> allCategories;
  final Function(List<String>) onCategoriesSelected;

  const CategorySelector({
    Key? key,
    required this.allCategories,
    required this.onCategoriesSelected,
  }) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.filter_list),
      itemBuilder: (BuildContext context) {
        return widget.allCategories.map((category) {
          return PopupMenuItem(
            value: category,
            child: Row(
              children: [
                Checkbox(
                  value: selectedCategories.contains(category),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null && value) {
                        selectedCategories.add(category);
                      } else {
                        selectedCategories.remove(category);
                      }
                      widget.onCategoriesSelected(selectedCategories);
                    });
                  },
                ),
                Text(category),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
