import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/Authnitication/auth.dart';
import 'package:nib_app/screens/Review/review.dart';
import 'package:nib_app/screens/Review/write%20review/write_review.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../main.dart';

Widget buildAddToCartAndWishListContainer({
  required String title,
  String? productId,
}) =>
    BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is WishListSuccessState) {
          HomeCubit.get(context).getWishList();
        }
      },
      builder: (context, state) {
        return Container(
          height: 5.h,
          width: 50.w,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            color: HexColor('#AA1050'),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'OpenSans',
                  fontSize: 11.sp,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                  radius: 13,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: HexColor('#AA1050'),
                      size: 12,
                    ),
                  )),
            ],
          ),
        );
      },
    );

Widget buildAddToCartRow({
  context,
  required String price,
  required String id,
  required int quantity,
}) =>
    Row(
      children: [
        Text(
          //Availability: In Stock
          price,
          style: TextStyle(
            fontSize: 11.sp,
            color: HexColor('#4CB8BA'),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        (prefs.getString('price_k') == 'kir')
            ? Text(
                'Kr',
                style: TextStyle(
                  fontSize: 14,
                  color: HexColor('#C9C9C9'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            : Text(
                '\$',
                style: TextStyle(
                  fontSize: 14,
                  color: HexColor('#C9C9C9'),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              ),
        const Spacer(),
        InkWell(
            onTap: () {
              if (prefs.getString("token") != null) {
                HomeCubit.get(context).addToCart(id: id, quantity: quantity);
              } else {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthniticationScreen()),
                    (route) => false);
              }
            },
            child: buildAddToCartAndWishListContainer(
              title: LocaleKeys.ADD_CART.tr(),
            )),
      ],
    );

Widget buildSeeAllButton() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 45,
      decoration: BoxDecoration(
        color: HexColor('#AA1050'),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: Text(
              LocaleKeys.See_All.tr(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans',
                fontSize: 12.sp,
              ),
            ),
          ),
          Spacer(),
          CircleAvatar(
              radius: 13,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: HexColor('#AA1050'),
                  size: 12,
                ),
              )),
        ],
      ),
    );

Widget buildRatingBarRow({
  context,
  required String id,
}) =>
    Row(
      children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 23,
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
          width: 3.w,
        ),
        InkWell(
          onTap: () {
            HomeCubit.get(context).getReviews(id: id);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ReviewScreen(
                        id: id,
                      )),
            );
          },
          child: Text(
            '1 ${LocaleKeys.Review.tr()} ',
            style: TextStyle(
              fontSize: 10.sp,
              color: HexColor('#C9C9C9'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 1.w,
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WriteReviewScreen(
                      iD: id,
                    )),
          ),
          child: Text(
            '| ${LocaleKeys.Write_Review.tr()}',
            style: TextStyle(
              fontSize: 10.sp,
              color: HexColor('#C9C9C9'),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
