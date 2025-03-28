import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_1/components/account_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  final VoidCallback showLoginPage;
  const Register({super.key, required this.showLoginPage});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    // text controllers
    final newEmail = TextEditingController();
    final newPassword = TextEditingController();
    final conformPassword = TextEditingController();
    final userName = TextEditingController();
    final userAge = TextEditingController();

    bool passwordConfirmed() {
      if (newPassword.text.trim() == conformPassword.text.trim()) {
        return true;
      } else {
        // todo : make visible error text that "password is not matching"
        return false;
      }
    }

    Future userData(String name, int age, String email) async {
      await FirebaseFirestore.instance.collection('users').add({
        'Name': name,
        'Age': age,
        'Email': email,
      });
    }

    Future signUp() async {
      if (passwordConfirmed()) {
        // creating user new account
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: newEmail.text.trim(),
          password: newPassword.text.trim(),
        );
        // Adding user data
        userData(
          userName.text.trim(),
          int.parse(userAge.text.trim()),
          newEmail.text.trim(),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.r, right: 30.r, top: 75.r),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Color.fromRGBO(32, 65, 186, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Create an account so you can explore all the\nexisting jobs",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            // Email Textfield
            Padding(
              padding: EdgeInsets.only(left: 16.r, right: 16.r),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    controller: userName,
                    cursorColor: Color.fromRGBO(32, 65, 186, 1),
                    cursorErrorColor: Colors.red,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.r),
                      filled: true,
                      hintText: "Name",
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
                    height: 10.h,
                  ),
                  TextField(
                    controller: userAge,
                    cursorColor: Color.fromRGBO(32, 65, 186, 1),
                    cursorErrorColor: Colors.red,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.r),
                      filled: true,
                      hintText: "Age",
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
                    height: 10.h,
                  ),
                  // new email textfield
                  TextField(
                    controller: newEmail,
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
                    height: 10.h,
                  ),
                  // New password textfield
                  TextField(
                    controller: newPassword,
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
                    height: 10.h,
                  ),
                  // Conform password textfield
                  TextField(
                    controller: conformPassword,
                    cursorColor: Color.fromRGBO(32, 65, 186, 1),
                    cursorErrorColor: Colors.red,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16.r),
                      filled: true,
                      hintText: "Conform Password",
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
                      signUp();
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Already have an account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.5,
                        decorationStyle: TextDecorationStyle.dotted,
                      ),
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
