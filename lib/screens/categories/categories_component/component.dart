import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buildSearchCardInCategoriesScreen() => Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.red,
            color: HexColor('#727C8E').withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)),
        // margin:  EdgeInsets.only(right: 15.w,bottom:7.h ,top: 7.h,left:14.w ),
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        height: 8.h,
        // width: 346,
        child: Row(
          children: [
            Image.asset('assets/images/Search.png'),
            SizedBox(
              width: 3.w,
            ),
            Text(
              LocaleKeys.Search.tr(),
              style: TextStyle(
                  color: HexColor('#515C6F').withOpacity(0.3),
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  fontFamily: 'OpenSans'),
            )
          ],
        ),
      ),
    );

Widget myDivider({
  required double height,
}) =>
    Container(
      width: double.infinity,
      height: height,
      color: Colors.grey[300],
    );

Widget buildCategoriesCard({required String title}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: HexColor('#171717'),
              fontSize: 12.sp,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
          Spacer(),
          CircleAvatar(
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 10,
            ),
            radius: 11,
            backgroundColor: HexColor('#AA1050'),
          ),
        ],
      ),
    );
