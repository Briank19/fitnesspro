import 'package:flutter/material.dart';
import 'package:oya_gym/screens/home/home_screen.dart';
import 'package:oya_gym/widgets/primary_text.dart';
import 'package:oya_gym/widgets/primary_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryText(
                text: 'Name',
                color: Colors.black,
              ),
              PrimaryTextField(
                controller: userNameController,
                obsecureText: false,
                hintText: 'Preffered Name',
              ),
              const SizedBox(
                height: 20,
              ),
              const PrimaryText(
                text: 'Age',
                color: Colors.black,
              ),
              PrimaryTextField(
                validator: (p0) {
                  if (p0!.isEmpty ||
                      p0.length < 2 ||
                      p0.length > 3 ||
                      int.parse(p0) > 100) {
                    return 'Error: Age must be between 10 and 100 years';
                  }
                  return null;
                },
                controller: ageController,
                obsecureText: false,
                hintText: 'Your Age',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              const PrimaryText(
                text: 'Height',
                color: Colors.black,
              ),
              PrimaryTextField(
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Height is required';
                  }
                  return null;
                },
                controller: heightController,
                obsecureText: false,
                hintText: 'Height in Cms',
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              const PrimaryText(
                text: 'Weight',
                color: Colors.black,
              ),
              PrimaryTextField(
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Weight is required';
                  }
                  return null;
                },
                controller: weightController,
                textInputType: TextInputType.number,
                obsecureText: false,
                hintText: 'Weight in Kgs',
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue.shade600,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      await prefs.setInt('age', int.parse(ageController.text));
                      await prefs.setDouble(
                          'weight', double.parse(weightController.text));
                      await prefs.setDouble(
                          'height', double.parse(heightController.text));
                      await prefs.setDouble('decimal', 1.5);
                      await prefs.setString(
                          'userName', userNameController.text);
                      await prefs.setString('action', 'Start');
                      await prefs.setBool('first_timer', false);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: PrimaryText(
                            text: 'Error: Please fill all fields',
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  },
                  child: const PrimaryText(
                    text: 'Continue',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
