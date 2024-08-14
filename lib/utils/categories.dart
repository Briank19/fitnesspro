import 'package:flutter/material.dart';

class Category {
  final String name;
  final String description;
  final IconData icon;

  Category({
    required this.name,
    required this.description,
    required this.icon,
  });

  // final List<Category> categories = [
  //   Category(name: 'Strength Training', icon: Icons.fitness_center),
  //   Category(name: 'Cardio', icon: Icons.directions_run),
  //   Category(name: 'Yoga', icon: Icons.self_improvement),
  //   Category(name: 'Group Classes', icon: Icons.group),
  //   Category(name: 'Cycling', icon: Icons.directions_bike),
  // ];
}
