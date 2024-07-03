import 'package:flutter/material.dart';


class Shipments extends StatelessWidget {
  const Shipments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Logistics'),
        backgroundColor: Colors.indigo,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0), // Adjust the radius as needed
          ),
        ),
    ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 100,
              color: Colors.orange,
            ),
            SizedBox(height: 20),
            Text(
              'This module is under development.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
