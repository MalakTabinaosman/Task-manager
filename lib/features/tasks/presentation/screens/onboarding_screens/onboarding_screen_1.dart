import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/features/tasks/presentation/screens/home/home_screen.dart';
import 'onboarding_screen_2.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  Future<void> skipOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => skipOnboarding(context),
            child: Text("Skip", style: TextStyle(color: Colors.blue)),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to Task App", style: TextStyle(fontSize: 22)),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text("Next"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => OnboardingScreen2()),
              );
            },
          ),
        ],
      ),
    );
  }
}
