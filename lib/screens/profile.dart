import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oya_gym/utils/profile_items.dart';
import 'package:oya_gym/widgets/primary_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = '';
  int age = 1;
  double height = 1;
  double weight = 1;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? savedUserName = prefs.getString('userName');
      final int? savedAge = prefs.getInt('age');
      final double? savedWeight = prefs.getDouble("weight");
      final double? savedHeight = prefs.getDouble('height');
      setState(() {
        userName = savedUserName!;
        age = savedAge!;
        height = savedHeight!;
        weight = savedWeight!;
      });
    });
  }

  List<PrifileItems> updateProfile() {
    return [
      PrifileItems(
        name: 'Weight',
        value: "${weight.toString()} Kg",
      ),
      PrifileItems(
        name: 'Height',
        value: '$height Cm',
      ),
      PrifileItems(
        name: 'BMI',
        value: (weight / (height / 100)).toStringAsFixed(2),
      ),
      PrifileItems(
        name: 'Age',
        value: '$age Years',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              PrimaryText(
                text: 'Whats Up ',
                color: Colors.grey.shade600,
              ),
              PrimaryText(
                text: userName,
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          const SizedBox(height: 25),
          MasonryGridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemCount: updateProfile().length,
            itemBuilder: (context, index) {
              final profileItem = updateProfile()[index];
              return ProfileContainer(item: profileItem);
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  final PrifileItems item;
  const ProfileContainer({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 + Random().nextDouble() * 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.blue.shade200,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryText(
            text: item.name,
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          PrimaryText(
            text: item.value,
            color: const Color.fromARGB(255, 48, 2, 2),
          ),
        ],
      ),
    );
  }
}
