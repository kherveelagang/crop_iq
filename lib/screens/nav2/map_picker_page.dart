import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPicker extends StatefulWidget {
  final LatLng initialLocation;

  const MapPicker({super.key, required this.initialLocation});

  @override
  State<MapPicker> createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  late GoogleMapController mapController;
  late LatLng selectedPosition;

  @override
  void initState() {
    super.initState();
    selectedPosition = widget.initialLocation;
  }

  void _onMapTap(LatLng position) {
    setState(() {
      selectedPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Location'),
        backgroundColor: Colors.green,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, selectedPosition),
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.initialLocation,
          zoom: 12,
        ),
        onTap: _onMapTap,
        markers: {
          Marker(
            markerId: const MarkerId('selected'),
            position: selectedPosition,
          ),
        },
        onMapCreated: (controller) {
          mapController = controller;
        },
      ),
    );
  }
}
