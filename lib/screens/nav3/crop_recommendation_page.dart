import 'package:flutter/material.dart';

class CropRecommendationPage extends StatefulWidget {
  final Map<String, dynamic> soilComposition;
  final List<Map<String, dynamic>> crops;

  const CropRecommendationPage({
    super.key,
    required this.soilComposition,
    required this.crops,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CropRecommendationPageState createState() => _CropRecommendationPageState();
}

class _CropRecommendationPageState extends State<CropRecommendationPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Recommendations'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const SizedBox(height: 16),
                  // Display recommendations header
                  Text(
                    'Based on the soil composition, these crops are recommended:',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  // Display each crop recommendation
                  ...widget.crops.map((crop) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Left: Image
                            Image.asset(
                              crop['image'],
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16),
                            // Right: Details and button
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    crop['name'],
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    crop['description'],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Return selected crop to the previous page
                                      Navigator.pop(context, crop);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightGreen,
                                    ),
                                    child: const Text('Add to Farm'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
      ),
    );
  }
}
