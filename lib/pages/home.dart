import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Logged with : ${user.email!}"),
            SizedBox(
              height: 10.h,
            ),
            MaterialButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              color: Color.fromRGBO(32, 65, 186, 1),
              textColor: Colors.white,
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
