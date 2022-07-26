import 'package:flutter/material.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/checkout/componnent/body.dart';
import 'package:nib_app/screens/checkout/payment.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/layout/cubit/cubit.dart';
import 'package:nib_app/screens/my_orders/orderDetail/componnent/constant.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

import '../cart/componnent/constant.dart';
import '../my_orders/cubit/cubit.dart';
import 'address/userAddresses.dart';
import 'componnent/placeOrderConstant.dart';

// ignore: use_key_in_widget_constructors
class PlaceOrder extends StatefulWidget {
  static List productData = [];

  // price!.forEach((element) {
  //    totalPrice += element.price * element.quantity;
  //  });
  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: true,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      children: [
        // (AppCubit.get(context).selectedItem != null)
        //     ? selectAddressCardStatic(
        //         fullName: UserAddress.name,
        //         addressTitle: UserAddress.addressTitle,
        //         state: UserAddress.state,
        //         city: UserAddress.city,
        //         addressId: UserAddress.addressId,
        //         context: context)
        //     : Container(),
        spaceH(15),
        Text(
          LocaleKeys.Your_Orders.tr() +
              '( ${HomeCubit.get(context).cart.length.toString()} )',
          style: headingStyle.copyWith(
              color: Colors.black,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold),
        ),
        spaceH(15),
        ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              PlaceOrder.productData.addAll(HomeCubit.get(context).cart);
              return orderItemCard(
                  price: HomeCubit.get(context).cart[index]['price'].toString(),
                  image: HomeCubit.get(context)
                      .cart[index]['cover_img']
                      .toString(),
                  context: context,
                  name: HomeCubit.get(context).cart[index]['name'].toString(),
                  Qty: HomeCubit.get(context)
                      .cart[index]['quantity']
                      .toString());
            },
            separatorBuilder: (context, index) => spaceH(10),
            itemCount: HomeCubit.get(context).cart.length),
        spaceH(15),
        paymentDetail(price: HomeCubit.get(context).cart),
        // spaceH(15),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   child: deliverTime(),
        // ),
        spaceH(15),
        placeOrderButton(
            context: context,
            title: LocaleKeys.Next.tr(),
            press: () {
              tabController!.animateTo(2,
                  duration: Duration(
                    milliseconds: 500,
                  ),
                  curve: Curves.easeInOut);
            }),
        // spaceH(250),
      ],
    );
    // );
  }
}
