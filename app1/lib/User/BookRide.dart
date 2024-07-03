import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class BookRide extends StatelessWidget {
  const BookRide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Ride'),

      ),
      drawer:const AppDrawer(),
      body:const Center(
          child:Text('User Feedback',
              style:TextStyle(fontSize: 20)
          )),

    );
  }
}
