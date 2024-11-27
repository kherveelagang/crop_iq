import 'dart:io';
import 'package:crop_iq/screens/nav2/added_crops_page.dart';
import 'package:flutter/material.dart';
import 'add_farm_page.dart'; // Updated to match the correct naming

class MyFarmsPage extends StatefulWidget {
  const MyFarmsPage({super.key});

  @override
  State<MyFarmsPage> createState() => _MyFarmsPageState();
}

class _MyFarmsPageState extends State<MyFarmsPage> {
  final List<Map<String, dynamic>> farms = []; // List for farms

  // Navigate to add farm page
  void _navigateToAddFarmPage() async {
    final Map<String, dynamic>? newFarm = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddFarmPage(
          onAddFarm: (Map<String, dynamic> newFarm) {
            setState(() {
              farms.add({
                ...newFarm,
                'crops': newFarm['crops'] ?? [], // Ensure crops are added
              });
            });
          },
          farm: const {},
        ),
      ),
    );

    if (newFarm != null) {
      setState(() {
        farms.add({
          ...newFarm,
          'crops': newFarm['crops'] ?? [], // Ensure crops are initialized
        });
      });
    }
  }

  // Build the farm card
  Widget _buildFarmCard(Map<String, dynamic> farm) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        children: [
          // Farm Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: farm['imagePath'] != null
                ? Image.file(
                    File(farm['imagePath']),
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/farm.jpg',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Farm Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        farm['farmName'] ?? 'Unknown Farm',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        farm['location'] ?? 'Unknown location',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Season: ${farm['season'] ?? "N/A"}',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                // Show Crops Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddedCropsPage(
                          farm: farm,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Show Crops'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Farms'),
      ),
      body: farms.isEmpty
          ? const Center(
              child: Text(
                "No farm added yet. Tap the + button to add your first farm.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: farms.length,
              itemBuilder: (context, index) {
                final farm = farms[index];
                return _buildFarmCard(farm);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddFarmPage,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
