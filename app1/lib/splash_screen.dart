import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization code here, e.g., loading data, etc.

    // Simulate a delay to show the splash screen for a few seconds
    Future.delayed(const Duration(seconds: 4), () {
      // Navigate to the next screen, e.g., your home page
      Navigator.pushReplacementNamed(context, '/'); // Replace with your desired route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your bus icon here
            const Icon(
              Icons.directions_bus,
              color: Colors.indigo, // Customize the bus icon color
              size: 64.0, // Customize the bus icon size
            ),
            const SizedBox(height: 20.0),
            // Add your animated text here
            TypewriterAnimatedTextKit(
              text: const ["MJ Travels"],
              textStyle: const TextStyle(
                color: Colors.indigo, // Customize the text color
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }
}