import 'package:flutter/material.dart';

class postScreen extends StatefulWidget {
  const postScreen({Key? key}) : super(key: key);

  @override
  State<postScreen> createState() => _postScreenState();
}

class _postScreenState extends State<postScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Screen"),),
    );
  }
}
