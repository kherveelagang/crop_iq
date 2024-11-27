import 'package:flutter/material.dart';

class AddedCropsPage extends StatefulWidget {
  final Map<String, dynamic> farm;
  const AddedCropsPage({super.key, required this.farm});

  @override
  _AddedCropsPageState createState() => _AddedCropsPageState();
}

class _AddedCropsPageState extends State<AddedCropsPage> {
  bool isLoading = false;
  String loadingText = "Fetching recommended crops...";

  // This will store selected crops from the modal dialog
  List<Map<String, dynamic>> selectedCrops = [];

  // Simulate fetching recommended crops based on soil composition
  Future<List<Map<String, dynamic>>> _getRecommendedCrops() async {
    setState(() {
      isLoading = true;
      loadingText = "Fetching recommended crops...";
    });

    await Future.delayed(const Duration(seconds: 2)); // Simulate loading time

    // Sample recommended crops (replace this with real recommendation logic)
    final recommendedCrops = [
      {
        'name': 'Maize',
        'description': 'Best suited for this soil composition.',
        'image': 'assets/images/maize.webp',
      },
      {
        'name': 'Wheat',
        'description': 'Thrives in moderately acidic soils.',
        'image': 'assets/images/wheat.jpeg',
      },
      {
        'name': 'Rice',
        'description': 'Ideal for clay-loam soil.',
        'image': 'assets/images/rice.png',
      },
    ];

    setState(() {
      isLoading = false;
    });

    return recommendedCrops;
  }

  // Function to add selected crops to the farm
  void _addSelectedCrops() {
    final List<Map<String, dynamic>> updatedCrops =
        List.from(widget.farm['crops']);

    // Loop through the selected crops and add only unique ones
    for (var selectedCrop in selectedCrops) {
      final isDuplicate =
          updatedCrops.any((crop) => crop['name'] == selectedCrop['name']);
      if (!isDuplicate) {
        updatedCrops.add(selectedCrop);
      }
    }

    // Update the farm with the new crops
    setState(() {
      widget.farm['crops'] = updatedCrops;
    });

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Selected crops added to the farm.")),
    );
  }

  // Show modal to select recommended crops
  void _showSelectCropsModal() async {
    final recommendedCrops = await _getRecommendedCrops();

    // Open a modal to let the user select crops
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Recommended Crops"),
          content: StatefulBuilder(
            builder: (context, setStateDialog) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: recommendedCrops.map((crop) {
                    return CheckboxListTile(
                      title: Text(crop['name'] ?? 'Unnamed Crop'),
                      subtitle: Text(crop['description'] ?? 'No description'),
                      value: selectedCrops.contains(crop),
                      onChanged: (bool? value) {
                        setStateDialog(() {
                          if (value == true) {
                            selectedCrops.add(crop); // Add crop to selection
                          } else {
                            selectedCrops
                                .remove(crop); // Remove crop from selection
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _addSelectedCrops(); // Add the selected crops to the farm
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Add Selected"),
            ),
          ],
        );
      },
    );
  }

  // Show a dialog with crop details
  void _showCropDetails(Map<String, dynamic> crop) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(crop['name'] ?? 'Unnamed Crop'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              crop['image'] != null
                  ? Image.asset(
                      crop['image'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image, size: 100),
              const SizedBox(height: 10),
              Text(crop['description'] ?? 'No description available.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Safely cast the crops list to List<Map<String, dynamic>>
    final List<Map<String, dynamic>> crops = (widget.farm['crops'] as List?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList() ??
        [];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.farm['farmName'] ?? 'Unnamed Farm'} - Crops'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // Display loading indicator if fetching crops
          if (isLoading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          // Display crops list if no loading
          if (!isLoading)
            crops.isEmpty
                ? const Center(
                    child: Text(
                      "No crops added yet for this farm.",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: crops.length,
                      itemBuilder: (context, index) {
                        final crop = crops[index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: crop['image'] != null
                                ? Image.asset(
                                    crop['image'],
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.image),
                            title: Text(crop['name'] ?? 'Unnamed Crop'),
                            subtitle:
                                Text(crop['description'] ?? 'No description'),
                            onTap: () => _showCropDetails(
                                crop), // Show details when tapped
                          ),
                        );
                      },
                    ),
                  ),
        ],
      ),
      // Floating Action Button for fetching recommended crops
      floatingActionButton: FloatingActionButton(
        onPressed: _showSelectCropsModal, // Open the modal
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
