import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nib_app/screens/product_detail/product_detail_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Widget buildSearchCardInHomeScreen() => Container(
      height: 10.h,
      color: HexColor('#EFEFEF'),
      child: Container(
        decoration: BoxDecoration(
            color: HexColor('#727C8E').withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        // height: 6.h,
        // width: 346,
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
    );

Widget buildCategoriesItems(
        {required String pathImage, required String title, context}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      // height: 115,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 10.h,
                  width: 18.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: customCachedNetworkImage(
                      url: pathImage, context: context, fit: BoxFit.contain)),
              Text(
                title,
                style: TextStyle(
                    color: HexColor('#515C6F'),
                    fontSize: 15,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );

Widget buildBrandsItem(
        {required String pathImage, required String title, context}) =>
    Container(
      width: 120,
      child: Stack(
        children: [
          Container(
            height: 45.h,
            // width: 50.w,
            child: customCachedNetworkImage(
                url: pathImage, context: context, fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.only(top: 18.h),
            decoration: BoxDecoration(
              color: HexColor('#AA1050'),
              // gradient: LinearGradient(
              //     colors: [HexColor('#40A2A6'), HexColor('#4CB8BA')])
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  color: HexColor('#FFFFFF'),
                ),
              ),
            ),
          )
        ],
      ),
    );

Widget buildTimeCardItem({
  required String timeUnm,
  required String timeOption,
}) =>
    Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          gradient: LinearGradient(
              colors: [HexColor('#FF9000'), HexColor('#FFBE03')])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            timeUnm,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: HexColor('#FFFFFF'),
              fontFamily: 'OpenSans',
              fontSize: 25,
            ),
          ),
          Text(
            timeOption,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: HexColor('#FFFFFF'),
              fontFamily: 'OpenSans',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );

Widget buildNationalDayProductsItem({
  required String image,
  required String name,
  required String price,
  required String id,
  context,
}) =>
    Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
      ),
      width: 45.w,
      decoration: BoxDecoration(
          border: Border.all(color: HexColor('#E7EAF0').withOpacity(0.3)),
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 15, color: HexColor('#E7EAF0'))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 24.h,
                width: 40.w,
                child: customCachedNetworkImage(
                    url: image, context: context, fit: BoxFit.contain),
              ),
              Container(
                margin: EdgeInsets.only(top: 2.h),
                height: 3.h,
                width: 10.w,
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
            height: 1.1.h,
          ),
          Row(
            children: [
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 13.sp,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                width: 2.w,
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
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$price ${LocaleKeys.Currency.tr()}',
                style: TextStyle(
                    color: HexColor('#4CB8BA'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp),
              ),
            ],
          ),
          SizedBox(
            height: 0.7.h,
          ),
          Row(
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
        ],
      ),
    );

Widget NationalDayProductsItem({
  required String image,
  context,
}) =>
    InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                    details: '',
                  ))),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        width: 45.w,
        // height: 90.h,
        decoration: BoxDecoration(
            border: Border.all(color: HexColor('#E7EAF0').withOpacity(0.3)),
            borderRadius: BorderRadius.circular(3),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 15, color: HexColor('#E7EAF0'))]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(image,
                    height: 24.h, width: 40.w, fit: BoxFit.contain),
                // Container(
                //   height: 24.h,
                //   width: 40.w,
                //   color: customCachedNetworkImage(url: image, context: context, fit: BoxFit.contain),
                // ),
                Container(
                  margin: EdgeInsets.only(top: 2.h),
                  height: 3.h,
                  width: 10.w,
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
              'Acer Aspire E',
              style: TextStyle(
                  color: HexColor('#515C6F'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp),
            ),
            SizedBox(
              height: 1.4.h,
            ),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 13.sp,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  width: 2.w,
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
              height: 1.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SAR 270',
                  style: TextStyle(
                      color: HexColor('#4CB8BA'),
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
                Text(
                  '|',
                  style: TextStyle(
                    color: HexColor('#C9C9C9'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'SAR 300',
                  style: TextStyle(
                    color: HexColor('#C9C9C9'),
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    decoration: TextDecoration.lineThrough,
                    decorationStyle: TextDecorationStyle.double,
                    decorationColor: HexColor('C9C9C9'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Image.asset('assets/images/interface.png'),
                Spacer(),
                Container(
                  width: 30.w,
                  height: 4.h,
                  padding: EdgeInsets.only(left: 3.w),
                  color: HexColor('#AA1050'),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Cart.png'),
                      SizedBox(
                        width: 3.w,
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
              ],
            ),
          ],
        ),
      ),
    );
