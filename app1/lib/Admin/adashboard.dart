import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class adashboard extends StatelessWidget {
  const adashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      drawerEnableOpenDragGesture: true, // Enable opening the drawer with drag gesture
      drawer: const AppDrawer(), //Drawer
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: const <Widget>[
            DashboardCard(
              title: 'Sales',
              value: 'Rs.5,000',
              icon: Icons.monetization_on,
              color: Colors.blue,
            ),
            DashboardCard(
              title: 'Active Users',
              value: '500',
              icon: Icons.people,
              color: Colors.green,
            ),
            DashboardCard(
              title: 'Tickets Sold',
              value: '100',
              icon: Icons.airplane_ticket,
              color: Colors.orange,
            ),
            DashboardCard(
              title: 'Fleet',
              value: '23',
              icon: Icons.directions_bus,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardCard({super.key, 
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          // Add your action when a card is tapped
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                size: 36.0,
                color: color,
              ),
              const SizedBox(height: 16.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24.0,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}