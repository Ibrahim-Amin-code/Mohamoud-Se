import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:sizer/sizer.dart';

class DealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.7),
          child: Container(
            padding:
                EdgeInsets.only(top: 8.h, left: 5.w, bottom: 3.h, right: 5.w),
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
                  'Deals',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: HexColor('#515C6F'),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        primary: true,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: 1.h,
        ),
        children: [
          ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) => Column(
                    children: [
                      Container(
                        // width: 345,
                        height: 25.h,
                        child: Image.asset(
                          'assets/images/Image 33.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
                        decoration: BoxDecoration(
                            color: HexColor('#E5EFEF'),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        height: 11.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildTimeCardItem(
                                timeUnm: '06', timeOption: 'DAYS'),
                            buildTimeCardItem(
                                timeUnm: '23', timeOption: 'HOURS'),
                            buildTimeCardItem(
                                timeUnm: '35', timeOption: 'MINS'),
                            buildTimeCardItem(
                                timeUnm: '10', timeOption: 'SECS'),
                          ],
                        ),
                      ),
                    ],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 1.h,
                  ),
              itemCount: 5),
        ],
      ),
    );
  }
}
