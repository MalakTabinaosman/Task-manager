import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'features/tasks/presentation/pages/tasks_page.dart';

Future<void> main() async {
  runApp(const TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
  const TaskManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management App',
      themeMode: ThemeMode.system,
      theme: AppTheme.light(),
      home: const TasksPage(),
    );
  }
}