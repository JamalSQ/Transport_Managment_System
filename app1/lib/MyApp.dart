import 'package:flutter/material.dart';
import 'aboutUs.dart';
import 'contectUs.dart';
import 'User/Dashboard.dart';
import 'loginpage.dart';
import 'home_sliders.dart';
import 'select_cities.dart';
import 'splash_screen.dart';
import 'shipments.dart';
import 'user_model.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const splash_screen(),
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // // Checking if user is logged in or not
    bool isLoggedIn = Provider.of<UserModel>(context).isLoggedIn;
    // bool isLoggedOut = Provider.of<UserModel>(context).isLoggedOut;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text('Home'),
            const Spacer(),
            // implement  logic here to differentiate b/w admin or user login
            if (isLoggedIn)
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const Dashboard(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  // radius: 80,
                  backgroundColor: Colors.indigoAccent, // Set background color as per your design
                  child: Icon(
                    Icons.person,

                    color: Colors.white, // Set icon color as per your design
                  ),
                ),
              )
            else
                TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const loginPage(),
                    ),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                ),

          ],
        ),
        backgroundColor: Colors.indigo,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0),
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            child: home_sliders(),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  children: const <Widget>[
                    DashboardCard(
                      title: 'Book Ride',
                      icon: Icons.directions_bus,
                      color: Colors.blue,
                      destination: SelectCities(),
                    ),
                    DashboardCard(
                      title: 'Shipments',
                      icon: Icons.local_shipping_rounded,
                      color: Colors.green,
                      destination: Shipments(),
                    ),
                    DashboardCard(
                      title: 'Contact Us',
                      icon: Icons.contact_mail_outlined,
                      color: Colors.orange,
                      destination: contectUs(),
                    ),
                    DashboardCard(
                      title: 'About Us',
                      icon: Icons.history_edu,
                      color: Colors.indigo,
                      destination: aboutUs(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget destination;

  const DashboardCard({super.key, 
    required this.title,
    required this.icon,
    required this.color,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => destination,
            ),
          );
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            double iconSize = constraints.maxWidth * 0.4;
            double textSize = constraints.maxWidth * 0.1;

            return Container(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      icon,
                      size: iconSize,
                      color: color,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: textSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
