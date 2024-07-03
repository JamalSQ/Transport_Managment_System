import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'package:provider/provider.dart';
import 'package:app1/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UProfile extends StatefulWidget {
  const UProfile({super.key});


  @override
  _UProfileState createState() => _UProfileState();
}

class _UProfileState extends State<UProfile> {
  final CollectionReference _userRef = FirebaseFirestore.instance.collection('users');

  late String? userId;
  late String name;
  late String email;
  late int age;
  late String location;
  late String bio;

  late Future<void> fetchDataFuture;

  @override
  void initState() {
    super.initState();
    // Initialize user ID or fetch it from your authentication system
    userId = context.read<UserModel>().UId;
    name = '';
    email = '';
    age = 0;
    location = '';
    bio = '';
    fetchDataFuture = fetchDataFromFirebase();
  }

  Future<void> fetchDataFromFirebase() async {
    await _userRef.doc(userId).get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var userData = documentSnapshot.data() as Map<String, dynamic>;
        setState(() {
          name = userData['name'] ?? '';
          email = userData['email'] ?? '';
          age = userData['age'] as int? ?? 0;
          location = userData['location'] ?? '';
          bio = userData['bio'] ?? '';
        });

        Provider.of<UserModel>(context, listen: false).updateData(name,email);
      } else {
        print('Data not found');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Implement logic for editing user info here
              // You can navigate to an editing screen or show a dialog for editing
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: fetchDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingIndicator();
          } else {
            return _buildProfileContent();
          }
        },
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Stack(
      children: [
        _buildBlurredBackground(),
        const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8.0),
              Text("Getting data from the database..."),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const CircleAvatar(
              radius: 80,
              backgroundColor: Colors.indigo, // Set background color as per your design
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.white, // Set icon color as per your design
              ),
            ),

            const SizedBox(height: 16.0),
            UserInfoCard(Icons.person, 'Name', name),
            UserInfoCard(Icons.email, 'Email', email),
            UserInfoCard(Icons.cake, 'Age', age.toString()),
            UserInfoCard(Icons.location_on, 'Location', location),
            const SizedBox(height: 16.0),
            BioCard(bio),
          ],
        ),
      ),
    );
  }

  Widget _buildBlurredBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
      ),
    );
  }
}



class UserInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const UserInfoCard(this.icon, this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo), // Set icon color
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo, // Set title color
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            color: Colors.grey[600], // Set subtitle color
          ),
        ),
      ),
    );
  }
}

class BioCard extends StatefulWidget {
  final String bio;

  const BioCard(this.bio, {super.key});

  @override
  _BioCardState createState() => _BioCardState();
}

class _BioCardState extends State<BioCard> {
  bool expanded = false;

  void toggleExpansion() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Bio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.indigo, // Set title color
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.indigo, // Set icon color
              ),
              onPressed: toggleExpansion,
            ),
          ),
          if (expanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.bio,
                style: TextStyle(
                  color: Colors.grey[600], // Set text color
                ),
              ),
            ),
        ],
      ),
    );
  }
}
