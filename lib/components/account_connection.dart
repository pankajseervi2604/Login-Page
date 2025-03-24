import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountConnection extends StatelessWidget {
  final String imageId;
  const AccountConnection({super.key, required this.imageId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      onTap: () {},
      child: Container(
        height: 40.h,
        width: 60.w,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey[300],
        ),
        child: Image.asset(
          imageId,
          scale: 25,
        ),
      ),
    );
  }
}
