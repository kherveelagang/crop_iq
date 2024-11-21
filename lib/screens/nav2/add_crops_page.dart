import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCropPage extends StatefulWidget {
  const AddCropPage({super.key, required this.onAddCrop});

  final void Function(Map<String, dynamic> newCrop) onAddCrop;

  @override
  // ignore: library_private_types_in_public_api
  _AddCropPageState createState() => _AddCropPageState();
}

class _AddCropPageState extends State<AddCropPage> {
  final TextEditingController cropNameController = TextEditingController();
  String soilComposition = '';
  String weatherDescription = '';
  String? imagePath; // Variable to hold the image path

  void _detectSoilComposition() {
    Random random = Random();

    // Randomize soil composition values
    double pH = 6 + random.nextDouble() * 2; // pH range between 6 and 8
    String texture = ["Loamy", "Sandy", "Clay"][random.nextInt(3)];
    int fertility = random.nextInt(10) + 1; // Fertility range from 1 to 10

    // Randomize weather data
    double temperature =
        15 + random.nextDouble() * 20; // Temperature range from 15 to 35 °C
    double humidity =
        40 + random.nextDouble() * 60; // Humidity range from 40% to 100%
    double rainfall = random.nextDouble() * 300; // Rainfall range in mm

    // Generate description based on soil composition
    String soilDesc = '';
    if (pH < 6.5) {
      soilDesc =
          'The soil is slightly acidic, which can affect nutrient uptake for certain crops.';
    } else if (pH > 7.5) {
      soilDesc =
          'The soil is alkaline, which may not be ideal for most plants.';
    } else {
      soilDesc = 'The soil has a neutral pH, which is ideal for most crops.';
    }

    setState(() {
      soilComposition =
          'pH: ${pH.toStringAsFixed(1)}, $texture, Fertility: $fertility/10\n$soilDesc';
      weatherDescription = 'Temperature: ${temperature.toStringAsFixed(1)}°C, '
          'Humidity: ${humidity.toStringAsFixed(1)}%, Rainfall: ${rainfall.toStringAsFixed(1)}mm';
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  void _saveCrop() {
    if (cropNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please provide a crop name.")),
      );
      return;
    }

    // Save the crop details
    final newCrop = {
      'cropName': cropNameController.text,
      'soilComposition': soilComposition,
      'weatherDescription': weatherDescription,
      'imagePath': imagePath,
      'date': DateTime.now().toString().split(' ')[0],
    };

    widget.onAddCrop(newCrop);
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Crop'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: cropNameController,
              decoration: const InputDecoration(
                labelText: 'Crop Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _detectSoilComposition,
              child: const Text('Detect Soil Composition & Weather'),
            ),
            const SizedBox(height: 16),
            if (soilComposition.isNotEmpty) ...[
              Text(
                'Soil Composition:\n$soilComposition',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Weather Information:\n$weatherDescription',
                style: const TextStyle(fontSize: 16),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Upload Image'),
            ),
            if (imagePath != null) ...[
              const SizedBox(height: 16),
              Text(
                'Image Selected: $imagePath',
                style: const TextStyle(fontSize: 16),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveCrop,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('Save Crop'),
            ),
          ],
        ),
      ),
    );
  }
}
