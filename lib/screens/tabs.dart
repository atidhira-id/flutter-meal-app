import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilter = kInitialFilter;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String indentifier) async {
    // Close the side drawer
    Navigator.of(context).pop();

    if (indentifier == 'filters') {
      // Push filter screen on top of stack
      final filterResult = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );

      log(filterResult.toString());

      setState(() {
        _selectedFilter = filterResult ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeal.where((meal) {
      if (!meal.isGlutenFree && _selectedFilter[Filter.glutenFree]!) {
        return false;
      }
      if (!meal.isLactoseFree && _selectedFilter[Filter.lactoseFree]!) {
        return false;
      }
      if (!meal.isVegetarian && _selectedFilter[Filter.vegetarian]!) {
        return false;
      }
      if (!meal.isVegan && _selectedFilter[Filter.vegan]!) {
        return false;
      }

      return true;
    }).toList();

    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    String activeTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(meals: []);
      activeTitle = "Your Favorite";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activeTitle)),
      drawer: MainDrawer(onSelectMenu: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
