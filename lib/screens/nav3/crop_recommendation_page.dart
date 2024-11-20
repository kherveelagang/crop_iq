import 'package:flutter/material.dart';

class CropRecommendationPage extends StatelessWidget {
  final Map<String, dynamic>? soilData;

  const CropRecommendationPage({super.key, this.soilData});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final soilType = args?['soilType'] ?? "Unknown";
    final temperature = args?['temperature'] ?? 0.0;
    final humidity = args?['humidity'] ?? 0.0;

    // Dummy recommendations
    List<String> recommendations = ["Tomatoes", "Corn", "Wheat"];
    if (soilType == "Loamy") recommendations = ["Potatoes", "Carrots"];

    return Scaffold(
      appBar: AppBar(title: const Text("Crop Recommendations")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Soil Type: $soilType"),
            Text("Temperature: $temperature°C"),
            Text("Humidity: $humidity%"),
            const SizedBox(height: 20),
            const Text(
              "Recommended Crops:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...recommendations.map((crop) => ListTile(title: Text(crop))),
          ],
        ),
      ),
    );
  }
}
