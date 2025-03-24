import 'package:firebase_practice_1/components/account_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.r, right: 30.r, top: 150.r),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Login here",
                  style: TextStyle(
                    color: Color.fromRGBO(32, 65, 186, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Welcome back you've\nbeen missed!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.r, right: 16.r),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    cursorColor: Color.fromRGBO(32, 65, 186, 1),
                    cursorErrorColor: Colors.red,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.r),
                      filled: true,
                      hintText: "Email",
                      fillColor: Color.fromRGBO(242, 245, 255, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(32, 65, 186, 1),
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextField(
                    cursorColor: Color.fromRGBO(32, 65, 186, 1),
                    cursorErrorColor: Colors.red,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.r),
                      filled: true,
                      hintText: "Password",
                      fillColor: Color.fromRGBO(242, 245, 255, 1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(32, 65, 186, 1),
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forget your password?",
                        style: TextStyle(
                          color: Color.fromRGBO(32, 65, 186, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(32, 65, 186, 1),
                      shadowColor: Colors.black,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      minimumSize: Size(double.infinity, 50.h),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Create new account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5,
                      decorationStyle: TextDecorationStyle.dotted,
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    "Or continue with",
                    style: TextStyle(
                      color: Color.fromRGBO(32, 65, 186, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AccountConnection(imageId: "assets/image/google.png"),
                      SizedBox(
                        width: 10.h,
                      ),
                      AccountConnection(imageId: "assets/image/facebook.png"),
                      SizedBox(
                        width: 10.h,
                      ),
                      AccountConnection(imageId: "assets/image/apple.png"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
