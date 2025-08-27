/// app_helper_functions.dart
///
/// Reusable helper functions that don't belong to a specific feature.
import 'package:flutter/material.dart';

void showSnack(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

