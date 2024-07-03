import 'MyApp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'user_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (!Firebase.apps.any((app) => app.name == '[DEFAULT]')){
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAtf2zU91FS5df21t2xXo2yb8UcowkAV8g",
      authDomain: "your_auth_domain",
      projectId: "tmsdb-68566",
      storageBucket: "tmsdb-68566.appspot.com",
      messagingSenderId: "your_messaging_sender_id",
      appId: "com.tms.app1",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: const MyApp(),
    ),
  );
}
