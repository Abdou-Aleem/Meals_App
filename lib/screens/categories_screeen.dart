import 'package:flutter/material.dart';
import 'package:mealapp/data/dummy_data.dart';
import 'package:mealapp/widgets/category_grid_item.dart';

import '../models/meal.dart';

class CategoriesScreeen extends StatelessWidget {
  const CategoriesScreeen({super.key, required this.availableMeals});

  // final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            // onToggleFavorite: onToggleFavorite,
            availableMeals: availableMeals,
          ),
      ],
    );
  }
}
