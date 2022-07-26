import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nib_app/screens/categories/categories_component/component.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:sizer/sizer.dart';

class SliderPrice extends StatefulWidget {
  const SliderPrice({Key? key}) : super(key: key);

  @override
  _SliderPriceState createState() => _SliderPriceState();
}

class _SliderPriceState extends State<SliderPrice> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RangeSlider(
          activeColor: HexColor('#FFBE03'),
          inactiveColor: HexColor('#2D2D2D'),
          values: _currentRangeValues,
          min: 0,
          max: 100,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        )
      ],
    );
  }
}

Widget buildEndDrawer() => Container(
      color: HexColor('#FFFFFF'),
      margin: EdgeInsets.only(top: 14.h),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [HexColor('#40A2A6'), HexColor('#4CB8BA')])),
              child: ListTile(
                title: Text(
                  'Filter by',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   Sorting by',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#B59945'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   Old',
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   New',
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   Price : Low to High',
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   Price : Low to High',
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   Brands',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#4CB8BA'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   Caiso',
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   Rolex',
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   Rado',
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: HexColor('#515C6F'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              child: ListTile(
                title: Text(
                  '   See All(20)',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: HexColor('#4CB8BA'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600),
                ),
                onTap: () {},
              ),
            ),
            myDivider(height: 1),
            Container(
              padding: EdgeInsets.only(right: 5.w, left: 8.w),
              // color: Colors.w,
              height: 8.h,
              child: Row(
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      color: HexColor('#B59945'),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                      fontSize: 11.sp,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'SR 0 - SR 1500',
                    style: TextStyle(
                      //2D2D2D
                      color: HexColor('#2D2D2D'),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                      fontSize: 11.sp,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SliderPrice(),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              height: 6.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      colors: [HexColor('#FF9000'), HexColor('#FFBE03')])),
              child: Row(
                children: [
                  Text(
                    'APPLY FILTERS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'OpenSans',
                      fontSize: 10.sp,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                      radius: 13,
                      backgroundColor: HexColor('#000000'),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: HexColor('#FFBE03'),
                          size: 12,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
