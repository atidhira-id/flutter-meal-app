import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onCategorySelect,
  });

  final Category category;
  final void Function() onCategorySelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCategorySelect,
      splashColor: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Container(padding: EdgeInsets.all(8), color: category.color),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              width: double.infinity,
              color: Color.fromARGB(80, 0, 0, 0),
              child: Text(
                category.title,
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
