import 'package:crop_iq/screens/nav2/map_picker_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // For Google Maps
import 'dart:io'; // For image handling
import 'package:image_picker/image_picker.dart'; // For image picking

class AddCropPage extends StatefulWidget {
  const AddCropPage(
      {super.key,
      required void Function(Map<String, String> newCrop) onAddCrop});

  @override
  // ignore: library_private_types_in_public_api
  _AddCropPageState createState() => _AddCropPageState();
}

class _AddCropPageState extends State<AddCropPage> {
  final TextEditingController cropNameController = TextEditingController();
  LatLng? selectedLocation; // For storing the location
  File? cropImage; // For storing the uploaded image
  bool soilDetected = false;
  String? soilType;
  double? soilTemperature;
  double? soilHumidity;
  String cropDescription = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Crop")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: cropNameController,
              decoration: const InputDecoration(labelText: "Crop Name"),
            ),
            const SizedBox(height: 10),

            // Google Maps Picker Button
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MapPickerPage()),
                );
                if (result != null && result is LatLng) {
                  setState(() {
                    selectedLocation = result;
                  });
                }
              },
              child: const Text("Select Location"),
            ),
            if (selectedLocation != null)
              Text(
                  "Selected Location: ${selectedLocation!.latitude}, ${selectedLocation!.longitude}"),

            const SizedBox(height: 10),

            // Image Picker
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    cropImage = File(pickedFile.path);
                  });
                }
              },
              child: const Text("Upload Image"),
            ),
            if (cropImage != null) Image.file(cropImage!, height: 150),

            const SizedBox(height: 10),

            // Detect Soil Composition Button
            ElevatedButton(
              onPressed: () {
                // Simulate soil composition data
                setState(() {
                  // Dummy values for soil detection
                  soilType = ["Loamy", "Sandy", "Clayey"]
                      .elementAt(DateTime.now().second % 3);
                  soilTemperature =
                      25.0 + (DateTime.now().second % 10); // Random 25-34°C
                  soilHumidity =
                      50.0 + (DateTime.now().millisecond % 50); // Random 50-99%
                  soilDetected = true;

                  // Generate a crop description based on dummy data
                  cropDescription = soilType == "Loamy"
                      ? "This soil is rich in nutrients and holds moisture well. Ideal for vegetables and grains."
                      : soilType == "Sandy"
                          ? "This soil drains quickly and is suitable for crops like watermelons, peanuts, and carrots."
                          : "This soil retains water and nutrients. Suitable for rice and other water-tolerant crops.";
                });
              },
              child: const Text("Detect Soil Composition"),
            ),

            // Display Soil Data
            if (soilDetected) ...[
              Text("Soil Type: $soilType"),
              Text("Soil Temperature: $soilTemperature°C"),
              Text("Soil Humidity: $soilHumidity%"),
              const SizedBox(height: 10),
              Text("Crop Description: $cropDescription"),
            ],

            const SizedBox(height: 20),

            // Get Crop Recommendation Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/recommendationPage', arguments: {
                  'soilType': soilType,
                  'temperature': soilTemperature,
                  'humidity': soilHumidity
                });
              },
              child: const Text("Get Crop Recommendation"),
            ),
          ],
        ),
      ),
    );
  }
}
