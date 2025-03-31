import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice_1/components/account_connection.dart';
import 'package:firebase_practice_1/pages/forget_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  // VoidCallback method is used to call the function without expecting any parameters
  final VoidCallback showRegisterPage;
  const Login({super.key, required this.showRegisterPage});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool onClicked = true;
  // text controllers
  final _email = TextEditingController();
  final _password = TextEditingController();

  // Sign in method
  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          closeIconColor: Colors.grey,
          showCloseIcon: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          margin: EdgeInsets.all(10.r),
          padding: EdgeInsets.only(left: 8.r, right: 8.r),
          behavior: SnackBarBehavior.floating,
          content: Text("Successfully Logined"),
        ),
      );
      Navigator.of(context).pop();
    } on FirebaseAuthException {
      Navigator.of(context).pop();
      String errorMessage = 'incorrect email or password. Please try again.';
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    // Disposing the controllers after using them
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

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
                  // Email textfield
                  TextField(
                    controller: _email,
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
                  // Password textfield
                  TextField(
                    controller: _password,
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
                      suffixIcon: IconButton(
                        icon: onClicked
                            ? Icon(CupertinoIcons.eye_slash)
                            : Icon(CupertinoIcons.eye),
                        onPressed: () {
                          setState(() {
                            onClicked = !onClicked;
                          });
                        },
                      ),
                    ),
                    obscureText: onClicked,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  // Forget password
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        ),
                      ),
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
                  // Sign in button
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
                      signIn();
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
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    // Create new account
                    child: Text(
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
