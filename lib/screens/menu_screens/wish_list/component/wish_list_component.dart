import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nib_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../generated/locale_keys.dart';
import '../../../../main.dart';
import '../../../home/home_cubit/states.dart';

Widget buildWishListProductsItem({
  required String image,
  required String price,
  required String name,
  required String id,
  required GestureTapCallback? onTap,
  required context,
}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 15, color: Colors.black12)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 17.h,
                // color: ,
                child: customCachedNetworkImage(
                    url: image, context: context, fit: BoxFit.contain),
              ),
              Container(
                margin: EdgeInsets.only(top: 1.h),
                height: 3.h,
                width: 11.w,
                decoration: BoxDecoration(
                  color: HexColor('#AA1050'),
                  // gradient: LinearGradient(
                  //     colors: [HexColor('#FF9000'), HexColor('#FFBE03')])
                ),
                child: Center(
                  child: Text(
                    'NEW',
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans',
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: HexColor('#515C6F'),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                fontSize: 13.sp),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 1.5.w,
              ),
              Text(
                '(4.5)',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: HexColor('#C9C9C9'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.5.w),
            child: Row(
              children: [
                InkWell(
                    onTap: onTap,
                    child: Image.asset('assets/images/interface.png')),
                Spacer(),
                Container(
                  width: 28.w,
                  height: 3.5.h,
                  padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
                  color: HexColor('#AA1050'),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Cart.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'OpenSans',
                            color: HexColor('#FFFFFF')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
