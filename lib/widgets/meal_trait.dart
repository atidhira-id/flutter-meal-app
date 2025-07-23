import 'package:flutter/material.dart';

class MealTrait extends StatelessWidget {
  const MealTrait({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 15),
        const SizedBox(width: 2),
        Text(text, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
