import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants/app_colors.dart';
import 'package:task_management_app/features/tasks/presentation/screens/home/widget/custom_floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      floatingActionButton: const CustomFloatingActionButton(),
      body: SizedBox(width: double.infinity, height: double.infinity
      , child: Column(
        children: [
          Container(
            height:100 ,
          )
        ],
      ),),
    );
  }
}


