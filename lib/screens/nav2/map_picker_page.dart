import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPickerPage extends StatefulWidget {
  const MapPickerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapPickerPageState createState() => _MapPickerPageState();
}

class _MapPickerPageState extends State<MapPickerPage> {
  LatLng _pickedLocation = const LatLng(10.3157, 123.8854); // Default location

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pick Location")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _pickedLocation,
          zoom: 12,
        ),
        onTap: (location) {
          setState(() {
            _pickedLocation = location;
          });
        },
        markers: {
          Marker(
              markerId: const MarkerId("selected"), position: _pickedLocation)
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, _pickedLocation);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
