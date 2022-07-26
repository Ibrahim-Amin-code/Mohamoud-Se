import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/checkout/checkout.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:nib_app/screens/menu_screens/profile/profile_component/profile_component.dart';
import 'package:nib_app/screens/my_orders/cubit/states.dart';

import '../../../main.dart';
import '../../home/home_cubit/home_cubit.dart';
import 'constant.dart';

import 'package:sizer/sizer.dart';

// ignore: use_key_in_widget_constructors
class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetCartErrorState) {
          Center(
              child: Text(
            'No Data Found',
            style: TextStyle(
              color: Colors.red,
              fontSize: 15.sp,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
            ),
          ));
        }
        if (state is SendOrderSuccessState) {
          HomeCubit.get(context).cart.clear();
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetCartLoadingState,
          builder: (context) => (HomeCubit.get(context).cart.isNotEmpty)
              ? ListView(
                  primary: true,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                  children: [
                    ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return cartItemCard(
                            id: HomeCubit.get(context).cart[index]['id'],
                            image: HomeCubit.get(context)
                                .cart[index]['cover_img']
                                .toString(),
                            name: HomeCubit.get(context)
                                .cart[index]['name']
                                .toString(),
                            price: HomeCubit.get(context)
                                .cart[index]['price']
                                .toString(),
                            quantity: HomeCubit.get(context)
                                .cart[index]['counter']
                                .toString(),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 2.h,
                            ),
                        itemCount: HomeCubit.get(context).cart.length),
                    spaceH(20),
                    // optionCard(),
                    // spaceH(20),
                    placeOrderButton(
                        context: context,
                        title: LocaleKeys.Complete_Oreder.tr(),
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckoutScren())))
                  ],
                )
              : Center(
                  child: Text(
                  'No Products Here... Please Add Some Product',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  cartItemCard({
    required String image,
    required String name,
    required dynamic price,
    required String quantity,
    required int id,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.w,
            height: 16.h,
            child: customCachedNetworkImage(
                url: image, context: context, fit: BoxFit.contain),
          ),
          SizedBox(
            width: 1.w,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 55.w,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: headingStyle.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor("#515C6F")),
                  ),
                ),
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
                SizedBox(
                  height: 2.h,
                ),
                // countRow(id: id),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: '${LocaleKeys.Quan.tr()}: ',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                  TextSpan(
                    text: quantity,
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ]))
              ],
            ),
          ),
          // SizedBox(width: 2.w),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is RemoveFromCartSuccessState) {
                  HomeCubit.get(context).getCard();
                }
              },
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    HomeCubit.get(context).rwmoveFromCart(id: id.toString());
                  },
                  child: const Icon(
                    Icons.clear,
                    size: 27,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
