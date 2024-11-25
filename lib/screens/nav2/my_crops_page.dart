import 'dart:io';
import 'package:flutter/material.dart';
import 'add_crops_page.dart';

class MyCropsPage extends StatefulWidget {
  const MyCropsPage({super.key});

  @override
  State<MyCropsPage> createState() => _MyCropsPageState();
}

class _MyCropsPageState extends State<MyCropsPage> {
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

  Widget _buildCropCard(Map<String, dynamic> crop) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: crop['imagePath'] != null
                    ? Image.file(
                        File(crop['imagePath']),
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  crop['cropName'] ?? 'Unknown Crop',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      crop['location'] ?? 'Unknown location',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Planted: ${crop['date'] ?? "N/A"}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => _showCropDetailsModal(context, crop),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.green),
                      ),
                    ),
                    child: const Text(
                      'Details',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCropDetailsModal(BuildContext context, Map<String, dynamic> crop) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Crop Name and Date
                Text(
                  crop['cropName'] ?? 'Unknown Crop',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Planted on ${crop['date'] ?? 'N/A'} • ${crop['location'] ?? 'Unknown location'}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // Crop Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: crop['imagePath'] != null
                      ? Image.file(
                          File(crop['imagePath']),
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/farm.jpg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(height: 16),

                // Task checklist
                Column(
                  children: [
                    _buildCheckBoxRow('Must be fertilized', true, 'Today'),
                    _buildCheckBoxRow('Must be watered', false, '3 days ago'),
                    _buildCheckBoxRow('Must be plowed', true, ''),
                  ],
                ),
                const SizedBox(height: 16),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('About soil'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.green),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Recommendations',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // About Soil Text Section
                const Text(
                  'About soil',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Dry subtropical climate is mostly characteristic for the region. These climates tend to have hot, sometimes extremely hot summers and warm to cool winters, with some to minimal precipitation, rainless summers and wetter winters.',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 16),

                // Soil Conditions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSoilConditionCard('Soil temperature', '37°C'),
                    _buildSoilConditionCard('Soil type', 'Loam'),
                    _buildSoilConditionCard('Soil humidity', '21%'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCheckBoxRow(
      String title, bool isChecked, String? additionalInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {},
            activeColor: Colors.green,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: isChecked ? Colors.black : Colors.red,
              fontWeight: isChecked ? FontWeight.normal : FontWeight.bold,
            ),
          ),
          if (additionalInfo != null && additionalInfo.isNotEmpty) ...[
            const SizedBox(width: 8),
            Text(
              '($additionalInfo)',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSoilConditionCard(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Crops'),
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
                return _buildCropCard(crop);
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
