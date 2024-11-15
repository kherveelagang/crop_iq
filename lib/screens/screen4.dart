import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  final VoidCallback onFinish; // Callback for the "Get Started" button

  const Screen4({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/bg.jpg",
              fit: BoxFit.cover,
              height:
                  200, // Adjust the height as needed for the background image
            ),
          ),
          Positioned(
            top: 350,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/farmer.jpg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  scale: 2.0,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          // Logo positioned independently
          Positioned(
            top: -50, // Adjust this value to move the logo higher or lower
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                "assets/images/logo_cropiq.png",
                width: 500, // Adjust width as needed
                height: 500, // Adjust height as needed
              ),
            ),
          ),
          // Texts positioned independently
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Prevents the column from taking full screen height
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Empowering farmers with smart choices",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Simplify Your Farming with Smart Crop Recommendations: CropIQ for Better Harvests",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
