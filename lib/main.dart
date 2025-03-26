import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
import 'package:firebase_practice_1/pages/home.dart';
import 'package:firebase_practice_1/pages/login.dart';
=======
import 'package:firebase_practice_1/auth/mainpage.dart';
>>>>>>> 1cee2fc (worked on adding user crenditials to authenticate user)
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        );
      },
    );
  }
}


