import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String userName = "John";
  final String location = "Butuan City, Philippines";
  final String weatherCondition = "Mostly Sunny";
  final double temperature = 25.0;
  final double humidity = 60.0;
  final double precipitation = 0.0;
  final double windSpeed = 10.0;
  final double pressure = 1010.0;

  final List<Map<String, String>> articles = [
    {
      "title": "Sustainable Farming Tips",
      "author": "Jane Doe",
      "readTime": "5 mins read",
      "image": "assets/images/blog_img.jpeg",
      "description":
          "Discover practical ways to adopt sustainable farming practices that benefit both the environment and your yield.",
      "content":
          "Sustainable farming is essential for preserving the environment and ensuring long-term productivity. "
              "This guide covers techniques like crop rotation, organic fertilization, and water conservation methods..."
    },
    {
      "title": "New Features in the App",
      "author": "John Smith",
      "readTime": "3 mins read",
      "image": "assets/images/blog_img2.jpg",
      "description":
          "Explore the latest updates and features introduced to make farming smarter and easier.",
      "content":
          "Our latest app update includes exciting features like advanced weather tracking, personalized recommendations, "
              "and streamlined user interfaces to make your farming activities more efficient."
    },
    {
      "title": "Climate-Smart Agriculture",
      "author": "Emily Clark",
      "readTime": "6 mins read",
      "image": "assets/images/blog_img3.webp",
      "description":
          "Learn about climate-smart strategies to improve resilience and productivity in agriculture.",
      "content":
          "Climate-smart agriculture involves techniques that adapt to changing climates while improving productivity. "
              "This includes efficient irrigation, heat-tolerant crops, and reducing carbon emissions from farming."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  // Welcome Header
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Welcome, $userName!",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Harness the power of precision farming with personalized crop suggestions.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  // Weather Card
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_pin,
                                  color: Colors.green),
                              const SizedBox(width: 8),
                              Text(
                                location,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "$temperature°C | $weatherCondition",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text("Humidity: $humidity%"),
                          Text("Precipitation: $precipitation mm"),
                          Text("Wind: ${windSpeed.toStringAsFixed(1)} mph"),
                          Text("Pressure: ${pressure.toStringAsFixed(1)} mb"),
                          const SizedBox(height: 12),
                          const Text(
                            "Today is a good day to apply pesticides.",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Rainy weather is predicted to occur in the next few days. Wednesday is a bad day to apply pesticides.",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Day 1
                      Expanded(
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "Wednesday",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Icon(Icons.cloud, color: Colors.blue, size: 36),
                                SizedBox(height: 8),
                                Text("Chance of rain: 40%"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Day 2
                      Expanded(
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  "Thursday",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Icon(Icons.umbrella,
                                    color: Colors.green, size: 36),
                                SizedBox(height: 8),
                                Text("Chance of rain: 50%"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

// Articles Carousel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Articles/Blogs:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Add article functionality is not available right now!")),
                          );
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      itemCount: articles.length,
                      controller: PageController(viewportFraction: 0.85),
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ArticleDetailsPage(article: article),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      article["image"]!,
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    article["title"]!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${article["author"]} · ${article["readTime"]}",
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    article["description"]!,
                                    style: const TextStyle(fontSize: 12),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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

class ArticleDetailsPage extends StatelessWidget {
  final Map<String, String> article;

  const ArticleDetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article["title"]!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                article["image"]!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              article["title"]!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "By ${article["author"]}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              article["content"]!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: HomePage()));
}
