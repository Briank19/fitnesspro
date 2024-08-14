import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oya_gym/utils/categories.dart';
import 'package:oya_gym/widgets/primary_text.dart';

class CategoryItemScreen extends StatefulWidget {
  final Category category;
  const CategoryItemScreen({
    super.key,
    required this.category,
  });

  @override
  State<CategoryItemScreen> createState() => _CategoryItemScreenState();
}

class _CategoryItemScreenState extends State<CategoryItemScreen> {
  List<String> assets = [
    'assets/lottie/press-ups.json',
    'assets/lottie/bench-press.json',
    'assets/lottie/yoga.json',
    'assets/lottie/muscles.json',
    'assets/lottie/group.json',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PrimaryText(
          text: widget.category.name,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 30,
        ),
        child: Column(
          children: [
            PrimaryText(
              text: widget.category.description,
              maxLines: 5,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Lottie.asset(
              assets[Random().nextInt(assets.length)],
            ),
          ],
        ),
      ),
    );
  }
}
