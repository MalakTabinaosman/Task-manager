import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:task_management_app/features/tasks/presentation/screens/onboarding_screens/onboarding_screen_1.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () async {
      final prefs = await SharedPreferences.getInstance();
      final seen = prefs.getBool('seenOnboarding') ?? false;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => seen ? HomeScreen() : OnboardingScreen1(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Tasky',
                speed: const Duration(milliseconds: 150),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
    );
  }
}
