import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oya_gym/utils/categories.dart';
import 'package:oya_gym/widgets/category_card.dart';
import 'package:oya_gym/widgets/primary_button.dart';
import 'package:oya_gym/widgets/primary_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeItems extends StatefulWidget {
  const HomeItems({super.key});

  @override
  State<HomeItems> createState() => _HomeItemsState();
}

class _HomeItemsState extends State<HomeItems> {
  final List<Category> categories = [
    Category(
      name: 'Muscles',
      icon: Icons.fitness_center,
      description:
          'Focus on strength training exercises to build and tone muscles.',
    ),
    Category(
      name: 'Cardio',
      icon: Icons.directions_run,
      description:
          'Engage in activities aimed at improving cardiovascular health and endurance.',
    ),
    Category(
      name: 'Yoga',
      icon: Icons.self_improvement,
      description:
          'Practice yoga poses and breathing techniques for flexibility and relaxation.',
    ),
    Category(
      name: 'Group',
      icon: Icons.group,
      description:
          'Participate in group fitness classes for motivation and social interaction.',
    ),
    Category(
      name: 'Cycling',
      icon: Icons.directions_bike,
      description:
          'Enjoy cycling workouts indoors or outdoors for cardio and lower body strength.',
    ),
    // Add more categories here with their descriptions
    Category(
      name: 'Pilates',
      icon: Icons.fitness_center,
      description:
          'Strengthen core muscles and improve flexibility through controlled movements.',
    ),
    Category(
      name: 'HIIT',
      icon: Icons.directions_run,
      description:
          'High-intensity interval training alternates between short bursts of intense exercise and brief recovery periods for maximum calorie burn.',
    ),
    Category(
      name: 'Dance',
      icon: Icons.directions_run,
      description:
          'Enjoy energetic dance routines for cardio, coordination, and fun!',
    ),
    Category(
      name: 'Stretching',
      icon: Icons.self_improvement,
      description:
          'Focus on stretching exercises to improve flexibility, prevent injury, and relieve muscle tension.',
    ),
    Category(
      name: 'Martial Arts',
      icon: Icons.group,
      description:
          'Learn self-defense techniques while improving strength, balance, and discipline.',
    ),
  ];
  String userName = '';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? savedUserName = prefs.getString('userName');
      setState(() {
        userName = savedUserName!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            text: 'Hello',
            color: Colors.grey.shade600,
            fontSize: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(
                text: userName,
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const Icon(
                Icons.alarm,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade200,
                  Colors.blue.shade600,
                  // Colors.blue.shade800,
                  Colors.blue.shade600,
                  Colors.blue.shade400,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    PrimaryText(
                      text: 'Fit',
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(height: 10),
                    PrimaryText(
                      text: 'Embark on a fitness journey',
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 20),
                    const PrimaryText(
                      text: 'Start',
                      color: Colors.white,
                    ),
                  ],
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/images/male-gym.svg',
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.3,
                    colorFilter: ColorFilter.mode(
                      Colors.blue.shade900,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const PrimaryText(
            text: 'Categories',
            color: Colors.black87,
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              return CategoryCard(
                category: categories[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
