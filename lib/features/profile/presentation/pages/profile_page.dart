import 'package:flutter/material.dart';

/// Simple user profile page placeholder.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('User Profile')),
    );
  }
}

