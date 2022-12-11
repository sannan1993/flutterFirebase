import 'package:firebasetest/UI/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebasetest/UI/auth/login_screen.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class splashServices{
  void isLogin(BuildContext context){
    final _auth = FirebaseAuth.instance;

    final user = _auth.currentUser;

    if(user!= null){
      Timer(const Duration(seconds: 3),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> postScreen()))
      );

    }
    else{
      Timer(const Duration(seconds: 3),
              ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> loginScreen()))
      );

    }


  }
}
