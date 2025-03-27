// import 'package:firebase_practice_1/pages/login.dart';
// import 'package:firebase_practice_1/pages/register.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';

// class IndexScreen extends StatelessWidget {
//   const IndexScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(
//                 top: 100.r, left: 16.r, right: 16.r, bottom: 30.r),
//             child: Lottie.asset(
//               animate: true,
//               backgroundLoading: true,
//               frameRate: FrameRate(120),
//               filterQuality: FilterQuality.high,
//               'assets/illusturation/Animation - 1742824645954.json',
//             ),
//           ),
//           Text(
//             "Discover Your\nDream Job here",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Color.fromRGBO(32, 65, 186, 1),
//               fontWeight: FontWeight.bold,
//               fontSize: 28.sp,
//               wordSpacing: 2,
//               letterSpacing: 1.5,
//             ),
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Text(
//             "Explore all the existing job roles based on\nyour interest and study major",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(
//             height: 60.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 40.r, right: 40.r),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color.fromRGBO(32, 65, 186, 1),
//                     shadowColor: Colors.black,
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.r),
//                     ),
//                     minimumSize: Size(130.w, 50.h),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => Login(
//                         showRegisterPage: () {},
//                       ),
//                     ));
//                   },
//                   child: Text(
//                     "Login",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16.sp,
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => Register(
//                         showLoginPage: () {},
//                       ),
//                     ));
//                   },
//                   child: Text(
//                     "Register",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline,
//                       decorationThickness: 1.5,
//                       decorationStyle: TextDecorationStyle.dotted,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
