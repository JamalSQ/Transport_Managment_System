import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class aProfile extends StatefulWidget {
  const aProfile({super.key});

  @override
  _AProfileState createState() => _AProfileState();
}

class _AProfileState extends State<aProfile> {
  String name = 'Jamal Siddique';
  String email = 'jamalsid@example.com';
  int age = 30;
  String location = 'Okara, Pakistan';
  String bio = 'I love programming and exploring new technologies.';
  List<EducationInfo> educationInfo = [
    EducationInfo('A.Tech', 'ABESEC'),
    EducationInfo('12th', 'Okara Public College'),
    EducationInfo('High School', 'XYZ'),
  ];

  void editUserInfo() {
    // Implement logic for editing user info here
    // You can navigate to an editing screen or show a dialog for editing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: editUserInfo,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              const SizedBox(height: 16.0),
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
              const SizedBox(height: 16.0),
              // User Info Cards with icons
              UserInfoCard(Icons.person, 'Name', name),
              UserInfoCard(Icons.email, 'Email', email),
              UserInfoCard(Icons.cake, 'Age', age.toString()),
              UserInfoCard(Icons.location_on, 'Location  ',location),
              const SizedBox(height: 16.0),
              // Expandable Bio Card
              BioCard(bio),
              const SizedBox(height: 16.0),
              const Text(
                'Education Info',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8.0),
              // Education Info Cards
              for (var info in educationInfo)
                EducationInfoCard(info.degree, info.school),
            ],
          ),
        ),
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
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
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
            title: const Text('Bio'),
            trailing: IconButton(
              icon: Icon(expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
              onPressed: toggleExpansion,
            ),
          ),
          if (expanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.bio),
            ),
        ],
      ),
    );
  }
}

class EducationInfoCard extends StatelessWidget {
  final String degree;
  final String school;

  const EducationInfoCard(this.degree, this.school, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text(degree),
        subtitle: Text(school),
      ),
    );
  }
}

class EducationInfo {
  final String degree;
  final String school;

  EducationInfo(this.degree, this.school);
}
