import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:sizer/sizer.dart';

Widget buildMenuCardItem({
  required String title,
  required String imageIcon,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Container(
        height: 10.h,
        // color: Colors.black12,
        child: Row(
          children: [
            Image.asset(imageIcon, color: HexColor('#AA1050')),
            SizedBox(
              width: 3.w,
            ),
            Text(
              title,
              style: TextStyle(
                color: HexColor('#171717'),
                fontSize: 13.sp,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            CircleAvatar(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 12,
              ),
              radius: 13,
              backgroundColor: HexColor('#AA1050'),
            ),
          ],
        ),
      ),
    );
