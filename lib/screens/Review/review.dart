import 'package:flutter/material.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';

import 'componnent/body.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: use_key_in_widget_constructors
class ReviewScreen extends StatefulWidget {
  final String id;

  const ReviewScreen({Key? key, required this.id}) : super(key: key);
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F5F6F8"),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.7),
          child: Container(
            padding:
                EdgeInsets.only(top: 8.h, left: 5.w, bottom: 2.h, right: 3.w),
            child: Row(
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: HexColor('#4CB8BA'),
                      size: 25,
                    )),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  LocaleKeys.Review.tr(),
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: HexColor('#515C6F'),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )),
      body: ReviewBody(
        id: widget.id.toString(),
      ),
    );
  }
}
