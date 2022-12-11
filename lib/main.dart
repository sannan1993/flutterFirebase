import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'UI/spalsh_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase test',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: spScreen(),
    );
  }
}

