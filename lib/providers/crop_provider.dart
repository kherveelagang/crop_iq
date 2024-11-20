import 'package:flutter/material.dart';
import '../models/crop.dart';

class CropProvider with ChangeNotifier {
  final List<Crop> _crops = []; // Example list of crops

  List<Crop> get crops => _crops;

  void addCrop(Crop crop) {
    _crops.add(crop);
    notifyListeners();
  }
}
