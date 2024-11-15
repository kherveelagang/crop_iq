// import 'package:flutter/material.dart';
// import 'package:crop_iq/screens/login_screen.dart';
// import 'package:crop_iq/screens/screen1.dart';
// import 'package:crop_iq/screens/screen2.dart';
// import 'package:crop_iq/screens/screen3.dart';
// import 'package:crop_iq/screens/screen4.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();
//   int _currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           PageView(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPageIndex = index;
//               });
//             },
//             children: [
//               const Screen1(),
//               const Screen2(),
//               const Screen3(),
//               Screen4(
//                 onFinish: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginScreen()),
//                   );
//                 },
//               ),
//             ],
//           ),
//           if (_currentPageIndex < 3) ...[
//             Align(
//               alignment: const Alignment(0, 0.85),
//               child: SmoothPageIndicator(
//                 controller: _pageController,
//                 count: 4,
//                 effect: const WormEffect(
//                   dotHeight: 8,
//                   dotWidth: 8,
//                   activeDotColor: Colors.green,
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: 40,
//               left: 20,
//               right: 20,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()),
//                       );
//                     },
//                     child: const Text(
//                       "Skip",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_currentPageIndex < 3) {
//                         _pageController.nextPage(
//                           duration: const Duration(milliseconds: 500),
//                           curve: Curves.easeIn,
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.lightGreen,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       minimumSize: const Size(100, 50),
//                     ),
//                     child: const Text(
//                       "Next",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ] else ...[
//             Positioned(
//               bottom: 40,
//               left: 20,
//               right: 20,
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.lightGreen,
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       minimumSize: const Size(double.infinity, 50),
//                     ),
//                     child: const Text(
//                       "Get Started",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginScreen()),
//                       );
//                     },
//                     child: const Text(
//                       "Already have an account? Log In",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }
