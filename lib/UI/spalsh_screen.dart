import 'package:firebasetest/firebase_services/splash_services.dart';
import 'package:firebasetest/firebase_services/splash_services.dart';
import 'package:flutter/material.dart';

class spScreen extends StatefulWidget {
  const spScreen({Key? key}) : super(key: key);

  @override
  State<spScreen> createState() => _spScreenState();
}

class _spScreenState extends State<spScreen> {

  splashServices SplashScreen = splashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Firebase Splash screen",style: TextStyle(fontSize: 30),),),
    );
  }
}
