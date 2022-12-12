import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/UI/auth/verify_code.dart';
import 'package:firebasetest/utils/utils.dart';
import 'package:firebasetest/widgets/round_button.dart';
import 'package:flutter/material.dart';

class loginWithPhoneNumber extends StatefulWidget {
  const loginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<loginWithPhoneNumber> createState() => _loginWithPhoneNumberState();
}

class _loginWithPhoneNumberState extends State<loginWithPhoneNumber> {
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login With phonenumber"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: "+923008210164"),
            ),
            SizedBox(
              height: 50,
            ),
            roundButton(
              loading: loading,
                title: "login",
                onTap: () {
                  setState((){
                    loading = true;
                  });

                  _auth.verifyPhoneNumber(
                      phoneNumber: phoneNumberController.text.toString(),
                      verificationCompleted: (_) {
                        setState((){
                          loading = false;
                        });
                      },
                      verificationFailed: (e) {
                        setState((){
                          loading = false;
                        });
                        utils().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => verifyCodeScreen(verificationId: verificationId,)));
                        setState((){
                          loading = false;
                        });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        utils().toastMessage(e.toString());
                        setState((){
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
