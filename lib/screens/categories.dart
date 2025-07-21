import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _goToCategory(BuildContext context, Category category) {
    final List<Meal> meals = dummyMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: meals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      body: GridView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: availableCategories
            .map(
              (element) => CategoryGridItem(
                category: element,
                onCategorySelect: () {
                  _goToCategory(context, element);
                },
              ),
            )
            .toList(),
      ),
    ));
  }
}
