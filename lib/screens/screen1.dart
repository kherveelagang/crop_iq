import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Centering the entire content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center horizontally
            children: [
              Image.asset(
                "assets/images/smart_crop.png",
                height: 200, // Adjust the size as needed
              ),
              const SizedBox(height: 30),
              const Text(
                "Smart Crop\nRecommendations", // Multi-line text with a line break
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign:
                    TextAlign.center, // Ensures text is centered within its box
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Get personalized crop suggestions based on your soil, climate, and resources.",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                  ),
                  textAlign:
                      TextAlign.center, // Center the description text as well
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
