import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body!.text).documentElement!.text;
  return parsedString;
}

optionCard() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
    decoration: BoxDecoration(
        color: HexColor("#2D2D2D"), borderRadius: BorderRadius.circular(5)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 68.w,
          child: Text(
            LocaleKeys.Add_items.tr(),
            maxLines: 2,
            style: headingStyle.copyWith(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        Image.asset('assets/images/shipping.png'),
      ],
    ),
  );
}

//////////////////////////////////////////////////////////////////////////////////////

placeOrderButton(
    {required context, required String title, required VoidCallback press}) {
  return InkWell(
    onTap: press,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: HexColor('#AA1050'),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: HexColor("#B5994565").withOpacity(0.3),
              offset: const Offset(0, 3),
              spreadRadius: 3,
              blurRadius: 3)
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Text(title,
                style: headingStyle.copyWith(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            width: 5.w,
            height: 3.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_right,
                color: HexColor('#AA1050'),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
