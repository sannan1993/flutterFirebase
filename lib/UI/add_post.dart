import 'package:firebasetest/utils/utils.dart';
import 'package:firebasetest/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class addPostScreen extends StatefulWidget {
  const addPostScreen({Key? key}) : super(key: key);

  @override
  State<addPostScreen> createState() => _addPostScreenState();
}

class _addPostScreenState extends State<addPostScreen> {
  final postController = TextEditingController();
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('test');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: InputDecoration(
                hintText: "whats in your mind",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            roundButton(
                title: "Add",
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                    'title': postController.text.toString(),
                    'id': DateTime.now().millisecondsSinceEpoch.toString()
                  }).then((value) {
                    utils().toastMessage("Post added");
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    utils().toastMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
