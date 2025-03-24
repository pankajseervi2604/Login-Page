import 'package:firebase_practice_1/index_screen.dart';
import 'package:firebase_practice_1/login.dart';
import 'package:firebase_practice_1/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(screenWidth, screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowMaterialGrid: true,
          debugShowCheckedModeBanner: false,
          initialRoute: "/login",
          routes: {
            "/index": (context) => IndexScreen(),
            "/login": (context) => Login(),
            "/register": (context) => Register(),
          },
        );
      },
    );
  }
}
