// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../providers/crop_provider.dart';

// class MyCropsPage extends StatelessWidget {
//   const MyCropsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final crops = Provider.of<CropProvider>(context).crops;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Crops"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               // Navigate to Add Crops Page
//               Navigator.pushNamed(context, '/add_crops');
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: crops.length,
//         itemBuilder: (context, index) {
//           final crop = crops[index];
//           return ListTile(
//             leading: Image.asset(crop.imagePath,
//                 width: 50, height: 50, fit: BoxFit.cover),
//             title: Text(crop.title),
//             subtitle: Text("${crop.location}\n${crop.date}"),
//             isThreeLine: true,
//           );
//         },
//       ),
//     );
//   }
// }
