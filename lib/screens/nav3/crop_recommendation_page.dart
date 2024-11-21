import 'package:flutter/material.dart';

class CropRecommendationPage extends StatelessWidget {
  final List<Map<String, dynamic>> crops;

  const CropRecommendationPage({super.key, required this.crops});

  @override
  Widget build(BuildContext context) {
    // Generate recommendations based on crop data
    List<String> recommendations = [];
    for (var crop in crops) {
      final soilData = crop['soilComposition'] ?? '';
      final cropName = crop['cropName'] ?? 'Unknown Crop';

      if (soilData.contains("Loamy")) {
        recommendations.add("$cropName - Potatoes or Carrots");
      } else if (soilData.contains("Sandy")) {
        recommendations.add("$cropName - Tomatoes or Corn");
      } else {
        recommendations.add("$cropName - Wheat or Barley");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Crop Recommendations"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Recommendations Based on Your Crops:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...recommendations.map(
              (rec) => ListTile(
                leading: const Icon(Icons.eco, color: Colors.green),
                title: Text(rec),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
