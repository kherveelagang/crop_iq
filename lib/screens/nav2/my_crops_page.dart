import 'dart:io';
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
    // Navigate to AddCropPage and wait for new crop data
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
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddCropPage,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
