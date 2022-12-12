import 'package:firebasetest/UI/post_screen.dart';
import 'package:firebasetest/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/round_button.dart';


class verifyCodeScreen extends StatefulWidget {
  final String verificationId;
  const verifyCodeScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<verifyCodeScreen> createState() => _verifyCodeScreenState();
}

class _verifyCodeScreenState extends State<verifyCodeScreen> {

  bool loading = false;
  final _auth = FirebaseAuth.instance;
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: codeController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: "6 digit code"),
            ),
            SizedBox(
              height: 50,
            ),
            roundButton(
                loading: loading,
                title: "Verify",
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: codeController.text.toString());

                  try{
                    await _auth.signInWithCredential(credential);

                    Navigator.push(context,
                    MaterialPageRoute(builder:
                    (context)=> postScreen()));
                  }catch(e){
                    setState(() {
                      loading = false;
                    });
                    utils().toastMessage(e.toString());
                  }

                })
          ],
        ),
      ),
    );
  }
}
