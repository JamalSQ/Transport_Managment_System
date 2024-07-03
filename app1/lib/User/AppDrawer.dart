import 'package:app1/MyApp.dart';
import 'package:app1/User/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:app1/User/Wallet.dart';
import 'package:app1/User/TripHis.dart';
import 'package:app1/User/UProfile.dart';
import 'package:app1/User/MyTickets.dart';
import 'package:app1/User/FeedBack.dart';
import 'package:app1/User/ChangePass.dart';
import '../select_cities.dart';
import 'package:provider/provider.dart';
import 'package:app1/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    // updating data of logged in user
    String? name = Provider.of<UserModel>(context).Uname;
    String? email  = Provider.of<UserModel>(context).Uemail;

    return Drawer(
        child: ListView(padding: const EdgeInsets.all(0), children: [
       DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.indigo,
        ), //BoxDecoration
        child: UserAccountsDrawerHeader(
          decoration: const BoxDecoration(color: Colors.indigo),
          accountName: Text(
            name ?? 'Fetching...',
            style: const TextStyle(fontSize: 18),
          ),
          accountEmail: Text(email ?? 'Fetching...'),
          currentAccountPictureSize: const Size.square(50),
          currentAccountPicture: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "M",
              style: TextStyle(fontSize: 30.0, color: Colors.indigo),
            ), //Text
          ), //circleAvatar
        ), //UserAccountDrawerHeader
      ), //DrawerHeader
      ListTile(
        leading: const Icon(Icons.home_filled),
        title: const Text(' Home '),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.dashboard),
        title: const Text(' DashBoard '),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Dashboard(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text(' My Profile '),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const UProfile(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.book),
        title: const Text(' My Tickets '),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MyTickets(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.history),
        title: const Text(' Travel History '),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const TripHis(),
            ),
          );
        },
      ),
      // ListTile(
      //   leading: const Icon(Icons.heart_broken_sharp),
      //   title: const Text(' My Favourite Rides '),
      //   onTap: () {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) => fav_rides(),
      //       ),
      //     );
      //   },
      // ),
      ListTile(
        leading: const Icon(Icons.feedback),
        title: const Text(' Feedback '),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const FeedBack(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.directions_bus),
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
        leading: const Icon(Icons.password),
        title: const Text(' Change Password '),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ChangePass(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.edit),
        title: const Text(' Wallet '),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Wallet(),
            ),
          );
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

          Provider.of<UserModel>(context, listen: false).setLoggedIn(false,"NULL");
          _clearSession();
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
  void _clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn');

  }
}
