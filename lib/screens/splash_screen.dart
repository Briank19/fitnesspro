import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oya_gym/screens/details_screen.dart';
import 'package:oya_gym/screens/home/home_screen.dart';
import 'package:oya_gym/utils/constants.dart';
import 'package:oya_gym/widgets/primary_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () async {
        // Obtain shared preferences.
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final bool? firstTimer = prefs.getBool('first_timer');
        await prefs.setInt('counter', 10);
        // await prefs.setBool('first_timer', true);

        if (firstTimer == true || firstTimer == null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailsScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryText(
              text: Constants.appName,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
            Lottie.asset(
              'assets/lottie/group.json',
            ),
          ],
        ),
      ),
    );
  }
}
