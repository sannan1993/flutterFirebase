import 'package:flutter/material.dart';
import 'package:firebasetest/UI/auth/login_screen.dart';
import 'dart:async';

class splashServices{
  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 3),
        ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> loginScreen()))
    );

  }
}
