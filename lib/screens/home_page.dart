import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to SettingsPage when the settings icon is clicked
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to CropIQ Recommender System!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
