import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location = 'Your Location';
  String date = DateTime.now().toLocal().toString().split(' ')[0];
  double temperature = 0;
  double humidity = 0;
  double rainExpectation = 0;
  double windSpeed = 0;

  final List<Map<String, String>> crops = []; // List to store user-added crops

  @override
  void initState() {
    super.initState();
    _generateWeather(); // Generate weather on load
  }

  void _generateWeather() {
    Random random = Random();

    // Randomly generate weather data
    setState(() {
      temperature = 15 + random.nextDouble() * 10; // Between 15°C and 25°C
      humidity = 50 + random.nextDouble() * 30; // Between 50% and 80%
      rainExpectation = random.nextDouble() * 100; // Between 0% and 100%
      windSpeed = 10 + random.nextDouble() * 15; // Between 10 and 25 km/h
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, User!'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.orange),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Weather Information Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${temperature.toStringAsFixed(1)}°C',
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.cloud, size: 48, color: Colors.blue),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('Humidity: ${humidity.toStringAsFixed(1)}%'),
                    Text(
                        'Rain Expectation: ${rainExpectation.toStringAsFixed(1)}%'),
                    Text('Wind Speed: ${windSpeed.toStringAsFixed(1)} km/h'),
                  ],
                ),
              ),
            ),
          ),

          // Blog Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Blogs',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    // Navigate to the blog details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BlogDetailsPage()),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/images/blog_img.jpeg',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cotton Growing: Proper Conditions and Smart Cultivation',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'John Brown · 7 mins read',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Handle FAB action
      //   },
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

// Blog Details Page
class BlogDetailsPage extends StatelessWidget {
  const BlogDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Details'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/blog_img.jpeg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Blog title
            const Text(
              'Cotton Growing: Proper Conditions and Smart Cultivation',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Author and read time
            const Text(
              'John Brown · 7 mins read',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Blog content
            const Text(
              'Cotton cultivation requires careful planning and management of soil, water, and weather conditions. '
              'In this guide, we discuss the ideal growing conditions, how to prepare the soil, and techniques '
              'to ensure a healthy crop yield. Additionally, we touch on sustainable practices that can help preserve '
              'the environment while growing cotton effectively...',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            // const Text(
            //   'More details will go here...',
            //   style: TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }
}
