import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Home!',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // Add navigation or actions as needed
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Home button clicked!')),
                );
              },
              child: const Text('Do Something'),
            ),
          ],
        ),
      ),
    );
  }
}
