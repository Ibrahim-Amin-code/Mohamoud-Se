import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:sizer/sizer.dart';

import 'package:nib_app/screens/editAddress/editAddress.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../main.dart';
import '../../home/home_cubit/home_cubit.dart';
import '../../home/home_cubit/states.dart';

selectAddressCardStatic({
  required String fullName,
  required String addressTitle,
  required String state,
  required String city,
  required String addressId,
  required context,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              addressTitle,
              style: headingStyle.copyWith(
                  color: HexColor("#4CB8BA"),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditAddressScreen(
                              id: addressId,
                            )));
              },
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.1.h, horizontal: 3.w),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 3),
                            color: HexColor("#4CB8BA").withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 3),
                      ],
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    LocaleKeys.EDIT.tr(),
                    style: headingStyle.copyWith(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ))),
            ),
          ],
        ),
        Text(
          fullName,
          style: headingStyle.copyWith(
              color: HexColor("#515C6F"),
              fontSize: 13.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          city,
          style: headingStyle.copyWith(
              color: HexColor("#515C6F").withOpacity(0.5),
              fontSize: 11.sp,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          state,
          style: headingStyle.copyWith(
              color: HexColor("#4CB8BA"),
              fontSize: 12.sp,
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

/////////////////////////////////////////////////////////////////////////////////////

orderItemCard({
  required String image,
  required String Qty,
  required String price,
  required String name,
  required context,
}) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: HexColor("#E7EAF0"),
                offset: const Offset(0, 3),
                spreadRadius: 3,
                blurRadius: 3)
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 25.w,
              height: 12.h,
              child: customCachedNetworkImage(
                url: image,
                context: context,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 220,
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: headingStyle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: HexColor("#515C6F")),
                    ),
                  ),
                  Text(
                    "${price + ' ' + LocaleKeys.Currency.tr()}",
                    style: headingStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#4CB8BA")),
                  ),
                  Text(
                    "${LocaleKeys.Quan.tr()}:  $Qty",
                    style: headingStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#4CB8BA")),
                  ),
                ],
              ),
            ),
          ]));
}
//////////////////////////////////////////////////////////////////////////////////////

paymentDetail({
  List? price,
}) {
  return BlocConsumer<HomeCubit, HomeState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      num totalPrice = 0;
      price!.forEach((element) {
        totalPrice +=
            num.parse(element["price"]) * num.parse(element['quantity']);
      });

      return Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: HexColor("#E7EAF0"),
              offset: const Offset(0, 3),
              spreadRadius: 3,
              blurRadius: 3,
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.Payment_Summary.tr(),
                  style: headingStyle.copyWith(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor("#333333")),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    LocaleKeys.EDIT.tr(),
                    style: headingStyle.copyWith(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#4CB8BA")),
                  ),
                ),
              ],
            ),
            spaceH(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.Order_Total.tr(),
                  style: headingStyle.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor("#333333")),
                ),
                InkWell(
                  onTap: () {},
                  child: (prefs.getString('price_k') == 'kir')
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
                ),
              ],
            ),
            spaceH(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.COD_Charge.tr(),
                  style: headingStyle.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor("#333333")),
                ),
                InkWell(
                  onTap: () {},
                  child: (prefs.getString('price_k') == 'kir')
                      ? Text(
                          "0 " + "Kr",
                          style: TextStyle(
                              color: HexColor('#4CB8BA'),
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp),
                        )
                      : Text(
                          "0 " + "\$",
                          style: TextStyle(
                              color: HexColor('#4CB8BA'),
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp),
                        ),
                ),
              ],
            ),
            spaceH(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.Total_Amount.tr(),
                  style: headingStyle.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: HexColor("#4CB8BA")),
                ),
                InkWell(
                  onTap: () {},
                  child: (prefs.getString('price_k') == 'kir')
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
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
