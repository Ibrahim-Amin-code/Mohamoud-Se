import 'package:flutter/material.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: use_key_in_widget_constructors
class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        primary: true,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 3.w),
        children: [
          Center(
            child: Text(LocaleKeys.THANK_YOU.tr(),
                style: headingStyle.copyWith(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#AA1050'))),
          ),
          spaceH(7),
          Center(
            child: Text(LocaleKeys.FOR_YOUR_ORDER.tr(),
                style: headingStyle.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#333333"))),
          ),
          spaceH(7),
          Center(
            child: Text("${LocaleKeys.Order_Number.tr()}: #SC124535",
                style: headingStyle.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
          ),
          spaceH(6.h),
          Image.asset("assets/images/thank.png"),
          spaceH(20),
          Center(
            child: Text("ESTIMATED DELIVERY",
                style: headingStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#B59945"))),
          ),
          spaceH(10),
          Center(
            child: Text("Apr 30, 2020",
                style: headingStyle.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
          ),
          spaceH(20),
          trackOrderButton(context)
        ],
      ),
    );
  }

  trackOrderButton(context) {
    return InkWell(
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LayoutScreen(index: 2)),
            (route) => false);
      },
      child: Container(
        height: 7.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: HexColor('#AA1050'),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: HexColor("#B5994565").withOpacity(0.1),
                offset: const Offset(0, 3),
                spreadRadius: 3,
                blurRadius: 3)
          ],
          // gradient: LinearGradient(
          //     colors: [HexColor("#FF9000"), HexColor("#FFBE03")])
        ),
        child: Center(
          child: Text(LocaleKeys.Track.tr(),
              style: headingStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
