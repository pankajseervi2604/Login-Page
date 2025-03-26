import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< HEAD
import 'package:firebase_practice_1/pages/home.dart';
import 'package:firebase_practice_1/pages/login.dart';
=======
import 'package:firebase_practice_1/auth/auth_page.dart';
import 'package:firebase_practice_1/pages/home.dart';
>>>>>>> 1cee2fc (worked on adding user crenditials to authenticate user)
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
<<<<<<< HEAD
            return Login();
=======
            return AuthPage();
>>>>>>> 1cee2fc (worked on adding user crenditials to authenticate user)
          }
        },
      ),
    );
  }
}