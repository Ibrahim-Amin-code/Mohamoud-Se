import 'package:flutter/material.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../main.dart';

orderCardDetail({
  required String orderNum,
  required String paymentMethod,
  required String itemsNum,
  required String orderStatus,
  required String date,
  List? price,
}) {
  num totalPrice = 0;
  price!.forEach((element) {
    totalPrice += num.parse(element['price']) * num.parse(element['quantity']);
  });
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: Colors.white),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Order.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              orderNum,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Total_Amount.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
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
          height: 1.5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Items.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              itemsNum,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.PaymentMethod.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              paymentMethod,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Order_Status.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              orderStatus,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: (orderStatus !='delete')?  HexColor("#4CB8BA"):Colors.red),
            ),
          ],
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Date.tr(),
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: HexColor("#333333"))),
            Text(
              date,
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: HexColor("#4CB8BA")),
            ),
          ],
        ),
      ],
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////////////////////

productOrderDetail({
  required String price,
  required String qty,
  required String productName,
  required context,
  required String image,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: HexColor("#E7EAF0"),
              offset: const Offset(0, 3),
              spreadRadius: 3,
              blurRadius: 3)
        ]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100,
          height: 13.h,
          child: customCachedNetworkImage(
              url: image, context: context, fit: BoxFit.contain),
        ),
        SizedBox(
          width: 3.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                productName,
                overflow: TextOverflow.ellipsis,
                style: headingStyle.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: HexColor("#333333")),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            (prefs.getString('price_k') == 'kir')
                ? Text(
                    '${LocaleKeys.Price.tr()} : ' +
                        price.toString() +
                        " " +
                        "Kr",
                    style: TextStyle(
                        color: HexColor('#4CB8BA'),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp),
                  )
                : Text(
                    '${LocaleKeys.Price.tr()} : ' +
                        price.toString() +
                        " " +
                        "\$",
                    style: TextStyle(
                        color: HexColor('#4CB8BA'),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp),
                  ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              "${LocaleKeys.Quan.tr()} :  $qty",
              style: headingStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ],
        )
      ],
    ),
  );
}

///////////////////////////////////////////////////////////////////////////////////////

paymentDetail(List? price) {
  num totalPrice = 0;
  price!.forEach((element) {
    totalPrice += num.parse(element['price']) * num.parse(element['quantity']);
  });

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5), color: Colors.white),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Sub_Total.tr(),
                style: headingStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#333333"))),
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
          height: 1.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Total_Tax.tr(),
                style: headingStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#333333"))),
            (prefs.getString('price_k') == 'kir')
                ? Text(
                    "0.0 " "Kr",
                    style: TextStyle(
                        color: HexColor('#4CB8BA'),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp),
                  )
                : Text(
                    "0.0 " "\$",
                    style: TextStyle(
                        color: HexColor('#4CB8BA'),
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp),
                  ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Shipping.tr(),
                style: headingStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#333333"))),
            Text(
              'Free Shipping',
              style: headingStyle.copyWith(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: HexColor("#333333")),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(LocaleKeys.Amount_Paid.tr(),
                style: headingStyle.copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: HexColor("#4CB8BA"))),
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
      ],
    ),
  );
}
