import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_1/pages/home.dart';
import 'package:firebase_practice_1/pages/login.dart';
import 'package:flutter/material.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To ensure that if user is logged in or not
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return Login();
          }
        },
      ),
    );
  }
}