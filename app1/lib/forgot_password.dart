import 'package:flutter/material.dart';
import 'User/otpscreen.dart';

class forgot_password extends StatelessWidget {
  const forgot_password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.password, // Replace with the bus icon
                  size: 100.0,
                  color: Colors.indigo, // Set color to indigo
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Enter your email to reset your password',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 20.0),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const otpscreen(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo),
                  child: const Text('Reset Password'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50.0), // Adjust the radius as needed
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FlutterLogo(
              size: 100.0,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Forgot Password page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const forgot_password()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo),
              child: const Text('Forgot Password'),
            ),
          ],
        ),
      ),
    );
  }
}
