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
  final TextEditingController locationController = TextEditingController();
  String? imagePath;
  bool isLoading = false;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  Future<void> _saveCrop() async {
    if (cropNameController.text.isEmpty || locationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all the fields.")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Simulate a short delay (e.g., for saving to a database or API call)
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    // Save the crop details
    final newCrop = {
      'cropName': cropNameController.text,
      'location': locationController.text,
      'imagePath': imagePath,
      'date': DateTime.now().toString().split(' ')[0],
    };

    widget.onAddCrop(newCrop);

    // Show success dialog
    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text("Crop successfully added!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                if (Navigator.canPop(context)) {
                  Navigator.pop(context); // Return to previous page
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
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
            TextField(
              controller: locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
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
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: _saveCrop,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Detect Soil Composition'),
                  ),
          ],
        ),
      ),
    );
  }
}
