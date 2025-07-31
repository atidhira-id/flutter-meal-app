import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/providers/favorites_provider.dart';

class MealFavoriteButton extends ConsumerStatefulWidget {
  const MealFavoriteButton({super.key, required this.meal});

  final Meal meal;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MealFavoriteButtonState();
  }
}

class _MealFavoriteButtonState extends ConsumerState<MealFavoriteButton> {
  Meal? meal;
  bool? favoriteStatus;

  @override
  void initState() {
    super.initState();
    meal = widget.meal;
    favoriteStatus = ref
        .read(favoriteMealsProvider.notifier)
        .checkFavoriteStatus(meal!);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final mealFavoriteStatus = ref
            .read(favoriteMealsProvider.notifier)
            .toggleMealFavoriteStatus(meal!);

        setState(() {
          favoriteStatus = mealFavoriteStatus;
        });

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              favoriteStatus! ? 'Meal added as a favorite.' : 'Meal removed.',
            ),
          ),
        );
      },
      icon: favoriteStatus!
          ? Icon(Icons.favorite)
          : Icon(Icons.favorite_border),
    );
  }
}
