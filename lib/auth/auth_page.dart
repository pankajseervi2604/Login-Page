import 'package:firebase_practice_1/pages/login.dart';
import 'package:firebase_practice_1/pages/register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(
        showRegisterPage: toggleScreen,
      );
    } else {
      return Register(
        showLoginPage: toggleScreen,
      );
    }
  }
}
