import 'dart:io';
import 'package:crop_iq/screens/nav3/crop_recommendation_page.dart';
import 'package:flutter/material.dart';
import 'add_crops_page.dart';

class MyCropsPage extends StatefulWidget {
  const MyCropsPage({super.key});

  @override
  State<MyCropsPage> createState() => _MyCropsPageState();
}

class _MyCropsPageState extends State<MyCropsPage> {
  // Local in-memory storage for crops
  final List<Map<String, dynamic>> crops = [];

  void _navigateToAddCropPage() async {
    final Map<String, dynamic>? newCrop = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddCropPage(
          onAddCrop: (Map<String, dynamic> newCrop) {
            setState(() {
              crops.add(newCrop);
            });
          },
        ),
      ),
    );

    if (newCrop != null) {
      setState(() {
        crops.add(newCrop);
      });
    }
  }

  void _navigateToRecommendationsPage() {
    if (crops.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Add crops first to get recommendations."),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CropRecommendationPage(crops: crops),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Crops'),
        backgroundColor: Colors.green,
      ),
      body: crops.isEmpty
          ? const Center(
              child: Text(
                "No crops added yet. Tap the + button to add your first crop.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: crops.length,
              itemBuilder: (context, index) {
                final crop = crops[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: crop['imagePath'] != null
                        ? Image.file(
                            File(crop['imagePath']),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.eco, color: Colors.green),
                    title: Text(crop['cropName'] ?? 'Unknown Crop'),
                    subtitle: Text(
                      'Soil: ${crop['soilComposition']}\nWeather: ${crop['weatherDescription']}',
                    ),
                    trailing: Text('Planted: ${crop['date'] ?? "N/A"}'),
                  ),
                );
              },
            ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 80,
            right: 16,
            child: FloatingActionButton(
              onPressed: _navigateToAddCropPage,
              backgroundColor: Colors.green,
              child: const Icon(Icons.add),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: _navigateToRecommendationsPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Get Recommended Crops",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
