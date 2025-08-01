import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class MealFilterNotifier extends StateNotifier<Map<Filter, bool>> {
  MealFilterNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      });

  void setFilter(Filter filter, bool value) {
    state = {...state, filter: value};
    log(state.toString());
  }
}

final mealFilterProvider =
    StateNotifierProvider<MealFilterNotifier, Map<Filter, bool>>(
      (ref) => MealFilterNotifier(),
    );

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(mealFilterProvider);

  return meals.where((meal) {
    if (!meal.isGlutenFree && activeFilters[Filter.glutenFree]!) {
      return false;
    }
    if (!meal.isLactoseFree && activeFilters[Filter.lactoseFree]!) {
      return false;
    }
    if (!meal.isVegetarian && activeFilters[Filter.vegetarian]!) {
      return false;
    }
    if (!meal.isVegan && activeFilters[Filter.vegan]!) {
      return false;
    }

    return true;
  }).toList();
});
