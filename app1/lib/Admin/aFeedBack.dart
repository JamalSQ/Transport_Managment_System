import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class aFeedBack extends StatelessWidget {
  const aFeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeedBack About Ride'),
      ),
      drawer: const AppDrawer(),
      body:const Center(
        child:Text('User Feedback',
        style:TextStyle(fontSize: 20)
      )),

    );
  }
}
