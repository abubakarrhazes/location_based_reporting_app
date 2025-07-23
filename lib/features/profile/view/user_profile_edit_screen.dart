import 'package:flutter/material.dart';

class UserProfileEditScreen extends StatelessWidget {
  const UserProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: const Center(child: Text('Profile Edit Screen')),
    );
  }
}
