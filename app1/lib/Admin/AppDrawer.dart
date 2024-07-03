import 'package:app1/Admin/CurrentBookedTickets.dart';
import 'package:app1/Admin/EmployeeData.dart';
import 'package:app1/MyApp.dart';
import 'package:app1/Admin/adashboard.dart';
import 'package:app1/available_buses.dart';
import 'package:flutter/material.dart';
import 'package:app1/Admin/aprofile.dart';
import '../select_cities.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                accountName: Text(
                  "Mudassar Irshad",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("admin@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "M",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text(' DashBoard '),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const adashboard(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Info '),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const aProfile(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' Booked Tickets '),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const CurrentBookedTickets(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text(' Users'),
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => TripHis(),
                //   ),
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_bus),
              title: const Text(' Available Buses '),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const available_buses(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text(' Users Feedback '),
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => aFeedBack(),
                //   ),
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.thumb_up),
              title: const Text(' Book Ride '),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SelectCities(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.airline_seat_recline_normal_sharp),
              title: const Text(' Available tickets '),
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => select_cities(),
                //   ),
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_outline),
              title: const Text(' Employees '),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const EmployeeData(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.videogame_asset),
              title: const Text(' Assets '),
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => select_cities(),
                //   ),
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.report),
              title: const Text(' Weekly Report '),
              onTap: () {
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => select_cities(),
                //   ),
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () async {
                // Show a loading dialog
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Column(
                        children: [
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
                          ),
                          SizedBox(height: 10.0),
                          Text('Logging out...'),
                        ],
                      ),
                    );
                  },
                );
                // Simulate a delay (you would perform actual logout logic here)
                await Future.delayed(const Duration(seconds: 2));

                // Close the loading dialog
                Navigator.of(context).pop();

                // Provider.of<UserModel>(context, listen: false).setLoggedIn(false);
                // _clearSession();
                // Navigate to the HomeScreen
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
          ]));
  }
}
