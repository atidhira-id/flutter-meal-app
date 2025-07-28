import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/utils/string_utils.dart';
import 'package:meal_app/widgets/meal_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealListItem extends StatelessWidget {
  const MealListItem({
    super.key,
    required this.meal,
    required this.onMealSelect,
  });

  final Meal meal;
  final void Function() onMealSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      child: InkWell(
        onTap: onMealSelect,
        splashColor: Theme.of(context).primaryColor,
        child: Stack(
          children: [
            FadeInImage(
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              imageErrorBuilder: (context, error, stackTrace) =>
                  Center(child: Icon(Icons.error)),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromARGB(180, 0, 0, 0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealTrait(
                          text: '${meal.duration} min',
                          icon: Icons.schedule,
                        ),
                        MealTrait(
                          text: capitalizeWords(meal.complexity.name),
                          icon: Icons.work,
                        ),
                        MealTrait(
                          text: capitalizeWords(meal.affordability.name),
                          icon: Icons.attach_money_sharp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
