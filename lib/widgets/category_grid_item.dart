import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:transparent_image/transparent_image.dart';

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
          FadeInImage(
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(category.imageUrl!),
            imageErrorBuilder: (context, error, stackTrace) =>
                Center(child: Icon(Icons.error)),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              width: double.infinity,
              color: const Color.fromARGB(180, 0, 0, 0),
              child: Text(
                category.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
