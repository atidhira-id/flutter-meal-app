import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    required this.color,
    this.imageUrl,
  });

  final String id;
  final String title;
  final Color color;
  final String? imageUrl;
}
