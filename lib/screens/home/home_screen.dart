import 'package:flutter/material.dart';
import 'package:oya_gym/screens/home/home_items.dart';
import 'package:oya_gym/screens/profile.dart';
import 'package:oya_gym/screens/settings_screen.dart';
import 'package:oya_gym/utils/constants.dart';
import 'package:oya_gym/widgets/my_drawer.dart';
import 'package:oya_gym/widgets/primary_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    const HomeItems(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];
  int currentScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: PrimaryText(
          text: Constants.appName,
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.w800,
        ),
      ),
      drawer: const MyDrawer(),
      body: screens.elementAt(currentScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreenIndex,
        onTap: (value) {
          setState(() {
            currentScreenIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
