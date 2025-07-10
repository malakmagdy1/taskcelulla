import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static const String route = "/StartScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, 'LoginScreen');
              },
              child: Text("log out")),
          FirebaseAuth.instance.currentUser!.emailVerified
              ? Text("welcom")
              : ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.currentUser?.sendEmailVerification();
                  },
                  child: Text("please verified email"))
        ],
      ),
    );
  }
}
