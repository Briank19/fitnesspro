import 'package:flutter/material.dart';
import 'package:oya_gym/screens/category_item.dart';
import 'package:oya_gym/utils/categories.dart';
import 'package:oya_gym/widgets/primary_text.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade400,
            Colors.blue.shade200,
          ],
        ),
      ),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryItemScreen(
              category: category,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.all(10),
        leading: Icon(
          category.icon,
          size: 30,
        ),
        title: PrimaryText(
          text: category.name,
          color: const Color.fromARGB(255, 67, 5, 78),
          fontWeight: FontWeight.w800,
        ),
        subtitle: PrimaryText(
          text: category.description,
          color: const Color.fromARGB(255, 67, 5, 78),
          fontWeight: FontWeight.w800,
        ),
      ),
    );
    // return Container(
    //   padding: EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //     gradient: LinearGradient(
    //       colors: [
    //         Colors.blue.shade400,
    //         Colors.blue.shade200,
    //       ],
    //     ),
    //   ),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Icon(
    //         category.icon,
    //         color: const Color.fromARGB(255, 67, 5, 78),
    //         size: 30,
    //       ),
    //       Container(
    //         width: 2,
    //         color: const Color.fromARGB(188, 75, 23, 40),
    //       ),
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           PrimaryText(
    //             text: category.name,
    //             color: const Color.fromARGB(255, 67, 5, 78),
    //             fontWeight: FontWeight.w800,
    //           ),
    //           PrimaryText(
    //             text: category.description,
    //             color: const Color.fromARGB(255, 67, 5, 78),
    //             fontWeight: FontWeight.w800,
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
