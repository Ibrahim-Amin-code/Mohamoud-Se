import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/my_orders/orderDetail/orderDetail.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../main.dart';

Widget buildMyOrderCardItem({
  required context,
  dynamic details,
  required String orderNum,
  required String itemsNum,
  required String orderStatus,
  required String date,
  required String paymentMethod,
  List? price,
}) {
  num totalPrice = 0;
  price!.forEach((element) {
    totalPrice += num.parse(element["price"]) * num.parse(element['quantity']);
  });
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              LocaleKeys.Order.tr(),
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#333333')),
            ),
            Spacer(),
            Text(
              orderNum,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#4CB8BA')),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.Total_Amount.tr(),
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#333333')),
            ),
            Spacer(),
            /*
             (prefs.getString('price_k') == 'kir')
                    ? Text(
                        price + " " + "Kr",
                        style: TextStyle(
                            color: HexColor('#4CB8BA'),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                    : Text(
                        price + " " + "\$",
                        style: TextStyle(
                            color: HexColor('#4CB8BA'),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),* */

            (prefs.getString('price_k') == 'kir')
                ? Text(
                    totalPrice.toString() + " " + "Kr",
                    style: TextStyle(
                        color: HexColor('#4CB8BA'),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp),
                  )
                : Text(
                    totalPrice.toString() + " " + "\$",
                    style: TextStyle(
                        color: HexColor('#4CB8BA'),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp),
                  ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.Items.tr(),
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#333333')),
            ),
            Spacer(),
            Text(
              itemsNum,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#4CB8BA')),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.PaymentMethod.tr(),
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#333333')),
            ),
            Spacer(),
            Text(
              paymentMethod,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#4CB8BA')),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.Order_Status.tr(),
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#333333')),
            ),
            Spacer(),
            Text(
              orderStatus,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: (orderStatus !='delete')?  HexColor("#4CB8BA"):Colors.red),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.Date.tr(),
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#333333')),
            ),
            Spacer(),
            Text(
              date,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  color: HexColor('#4CB8BA')),
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OrderDetailScreen(
                        details: details,
                      ))),
          child: Container(
            height: 5.h,
            width: 30.w,
            decoration: BoxDecoration(
                color: HexColor('#AA1050'),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                LocaleKeys.Order_Details.tr(),
                style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: 'OpenSans',
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
