import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.indigo,
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
              title: 'Booked Tickets',
              value: '4',
              icon: Icons.airplane_ticket,
              color: Colors.indigo,
            ),
            DashboardCard(
              title: 'All Rides',
              value: '12',
              icon: Icons.people,
              color: Colors.green,
            ),
            DashboardCard(
              title: 'Total Rides',
              value: '4',
              icon: Icons.directions_bus,
              color: Colors.orange,
            ),
            DashboardCard(
              title: 'Products',
              value: '50',
              icon: Icons.shopping_basket,
              color: Colors.blue,
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