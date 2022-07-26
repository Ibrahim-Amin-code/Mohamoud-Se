// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'constants.dart';
import 'package:sizer/sizer.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 6.5.h,
      decoration: BoxDecoration(
        color: HexColor('#AA1050'),
        // gradient: LinearGradient(
        //     colors: [HexColor("#FF9000"), HexColor("#FFBE03")])
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.transparent,
        onPressed: press,
        child: Text(text,
            style: headingStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18)),
      ),
    );
  }
}
