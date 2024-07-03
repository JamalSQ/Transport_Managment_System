// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/cupertino.dart';
//
// class UserModel extends ChangeNotifier {
//    String name;
//    String email;
//    int age;
//    String location;
//    String bio;
//    List<EducationInfo> educationInfo;
//
//   UserModel({
//     required this.name,
//     required this.email,
//     required this.age,
//     required this.location,
//     required this.bio,
//     required this.educationInfo,
//   });
//
//   // Factory method to create a UserModel from a Map
//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       name: map['name'],
//       email: map['email'],
//       age: map['age'],
//       location: map['location'],
//       bio: map['bio'],
//       educationInfo: (map['educationInfo'] as List<dynamic>? ?? []).map((e) => EducationInfo.fromMap(e)).toList(),
//     );
//   }
//
//   // Method to convert UserModel to a Map
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'email': email,
//       'age': age,
//       'location': location,
//       'bio': bio,
//       'educationInfo': educationInfo.map((e) => e.toMap()).toList(),
//     };
//   }
//
//   // Method to set the login status in the UserModel
//   void setLoggedIn(bool loggedIn) {
//     // _isLoggedIn = value;
//     notifyListeners();
//     // Implement the logic to set the login status
//     // For example, you can update a variable or perform other actions
//   }
//
//   // Method to set user data in the UserModel
//   void setUserModel(UserModel userModel) {
//     // Implement the logic to set the user data
//     // For example, you can update the properties of this instance
//     // with the properties of the provided userModel
//     this.name = userModel.name;
//     this.email = userModel.email;
//     this.age = userModel.age;
//     this.location = userModel.location;
//     this.bio = userModel.bio;
//     this.educationInfo = userModel.educationInfo;
//   }
// }
//
// class EducationInfo {
//   final String degree;
//   final String school;
//
//   EducationInfo({
//     required this.degree,
//     required this.school,
//   });
//
//   // Factory method to create an EducationInfo from a Map
//   factory EducationInfo.fromMap(Map<String, dynamic> map) {
//     return EducationInfo(
//       degree: map['degree'],
//       school: map['school'],
//     );
//   }
//
//   // Method to convert EducationInfo to a Map
//   Map<String, dynamic> toMap() {
//     return {
//       'degree': degree,
//       'school': school,
//     };
//   }
// }
