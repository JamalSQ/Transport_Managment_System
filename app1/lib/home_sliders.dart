import 'package:flutter/material.dart';
import 'dart:async';

class home_sliders extends StatefulWidget {
  const home_sliders({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<home_sliders> {
  final List<Map<String, dynamic>> slides = [
    {
      'title': 'Welcome to MJ Transport Services',
      'subtitle': 'Your Journey Begins Here',
      'icon': Icons.directions_bus,
      'color': Colors.indigo,
    },
    {
      'title': 'Explore Our Fleet of Buses',
      'subtitle': 'Choose from a Wide Variety',
      'icon': Icons.airport_shuttle,
      'color': Colors.teal,
    },
    {
      'title': 'Book Your Ride Conveniently',
      'subtitle': 'Quick and Easy Booking',
      'icon': Icons.calendar_today,
      'color': Colors.orange,
    },
    {
      'title': 'Enjoy a Comfortable Journey',
      'subtitle': 'Luxurious Travel Experience',
      'icon': Icons.view_comfy,
      'color': Colors.blue,
    },
    {
      'title': 'Safety and Reliability Guaranteed',
      'subtitle': 'Your Safety is Our Priority',
      'icon': Icons.security,
      'color': Colors.red,
    },
    {
      'title': 'Create an Account',
      'subtitle': 'Join Us for Exclusive Offers',
      'icon': Icons.person_add,
      'color': Colors.green,
    },
  ];

  int currentPage = 0;
  late PageController _controller;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
      viewportFraction: 0.8,
    );
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentPage < slides.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
        _controller.jumpToPage(0);
      }
      _controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Change to your app's text direction if needed
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(height: 20.0),
            SizedBox(
              height: 200.0,
              child: PageView.builder(
                controller: _controller,
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  return SlideItem(
                    title: slides[index]['title'],
                    subtitle: slides[index]['subtitle'],
                    icon: slides[index]['icon'],
                    color: slides[index]['color'],
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10.0),
            CustomDotIndicator(
              itemCount: slides.length,
              currentPage: currentPage,
            ),
            const SizedBox(height: 10.0),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Ready to Book a Ride?',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Discover our wide range of buses and plan your journey today!',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDotIndicator extends StatelessWidget {
  final int itemCount;
  final int currentPage;

  const CustomDotIndicator({super.key, 
    required this.itemCount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
            (index) => buildDot(index: index),
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const SlideItem({super.key, 
  required this.title,
  required this.subtitle,
  required this.icon,
  required this.color,
});

@override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    padding: const EdgeInsets.all(20.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
          color: Colors.white,
        ),
        const SizedBox(height: 10.0),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10.0),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
}

