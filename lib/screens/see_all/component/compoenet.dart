import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:sizer/sizer.dart';

import '../../../main.dart';
import '../../search_class.dart';
import 'package:easy_localization/easy_localization.dart';

PreferredSizeWidget buildSearchCardInSeeAllScreen(context) => PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 80),
      child: Container(
        color: HexColor('#AA1050'),
        padding: EdgeInsets.only(top: 6.h, bottom: 2.h, left: 2.w),
        child: Row(
          children: [
            // ignore: prefer_const_constructors
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white.withOpacity(0.8),
                size: 40,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                showSearch(context: context, delegate: ProductsSearch());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 5.h,
                width: 75.w,
                child: Row(
                  children: [
                    Image.asset('assets/images/Search.png'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      LocaleKeys.Search.tr(),
                      style: TextStyle(
                          color: HexColor('#515C6F').withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          fontFamily: 'OpenSans'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget buildSeeAllProductsItem({
  required String image,
  required String price,
  required String name,
  required String id,
  required context,
}) =>
    Container(
      padding: EdgeInsets.only(right: 10, left: 10, top: 15),
      // width: 150,
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
                height: 15.h,
                // color: ,
                child: customCachedNetworkImage(
                    url: image, context: context, fit: BoxFit.contain),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                height: 3.h,
                width: 10.w,
                decoration: BoxDecoration(color: HexColor('#AA1050')
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
                fontSize: 14.sp),
          ),
          SizedBox(
            height: 1.0.h,
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
                // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '(4.5)',
                style: TextStyle(
                  fontSize: 14,
                  color: HexColor('#C9C9C9'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(
            height: 0.4.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (prefs.getString('price_k') == 'kir')
                    ? Text(
                        price + ' ' + 'Kr',
                        style: TextStyle(
                            color: HexColor('#4CB8BA'),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 11.sp),
                      )
                    : Text(
                        price + ' ' + '\$',
                        style: TextStyle(
                            color: HexColor('#4CB8BA'),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            fontSize: 11.sp),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 0.8.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 1.w, left: 1.w),
            child: Row(
              children: [
                BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return InkWell(
                        onTap: () {
                          HomeCubit.get(context).addToWishList(id: id);
                        },
                        child:
                            // ignore: unrelated_type_equality_checks
                            (HomeCubit.get(context).isFavourite[id] == false ||
                                    HomeCubit.get(context).isFavourite[id] ==
                                        null)
                                ? Icon(
                                    Icons.favorite_outline,
                                    color: Colors.yellow,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.yellow,
                                  ));
                  },
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    HomeCubit.get(context).addToCart(id: id, quantity: 1);
                  },
                  child: Container(
                    width: 28.w,
                    height: 4.h,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: HexColor('#AA1050'),
                    child: Row(
                      children: [
                        Image.asset('assets/images/Cart.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'OpenSans',
                              color: HexColor('#FFFFFF')),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 1.h,
          // ),
        ],
      ),
    );
