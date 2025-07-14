import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks/presentation/screens/home/home_screen.dart';
import 'package:task_management_app/core/themes/app_theme.dart';
import 'package:task_management_app/features/tasks/presentation/screens/test_screen.dart';

Future <void> main() async {
  runApp(const TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management App',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}