import 'dart:developer'; 
import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants/app_colors.dart';

class  CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() => _MyCustomFABState();
}

class _MyCustomFABState extends State<CustomFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        log("Task screen");
      },
      backgroundColor: Colors.blue,
      child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(child: Icon(Icons.add, color: AppColors.white)),
          ),
        ),
    );
  }
}
