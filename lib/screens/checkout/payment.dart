import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nib_app/generated/locale_keys.dart';

import 'package:nib_app/screens/cart/componnent/constant.dart';
import 'package:nib_app/screens/checkout/address/userAddresses.dart';
import 'package:nib_app/screens/checkout/placeOrder.dart';
import 'package:nib_app/screens/checkout/visa.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/home/home_cubit/home_cubit.dart';
import 'package:nib_app/screens/layout/cubit/cubit.dart';
import 'package:nib_app/screens/layout/cubit/states.dart';
import 'package:nib_app/screens/my_orders/cubit/cubit.dart';
import 'package:nib_app/screens/my_orders/cubit/states.dart';
import 'package:nib_app/screens/my_orders/orderSuccess/orderSuccess.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: use_key_in_widget_constructors
class PaymentScreen extends StatefulWidget {
  static String paymentMethod = '';

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // WebViewC
  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
      children: [
        // paymentTypeSelection(),
        spaceH(6.h),
        BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
            // HomeCubit.get(context).cart = [];
            if (state is SendOrderSuccessState) {
              HomeCubit.get(context).cart.clear();

              OrderCubit.get(context).getOrders();
              // ignore: prefer_const_constructors

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderSuccessScreen()));
            } else if (state is SendOrderErrorState) {
              Fluttertoast.showToast(
                  msg: 'Order Faild... Please Try Again Later',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          },
          builder: (context, state) {
            return placeOrderButton(
                context: context,
                title: LocaleKeys.CONTINUE_PAYMENT.tr(),
                press: () {
                  OrderCubit.get(context).sendOrder(
                    context: context,
                    addressId: UserAddress.addressId.toString(),
                    paymentMethod: PaymentScreen.paymentMethod.toString(),
                    productId: HomeCubit.get(context).cart,
                  );
                });
          },
        )
      ],
    );
  }

  paymentTypeSelection() {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 3),
                  spreadRadius: 3,
                  blurRadius: 3,
                  color: HexColor("#5858581F").withOpacity(0.1))
            ],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/Forma 1 copy 11.png"),
                  spaceW(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        LocaleKeys.Cash.tr(),
                        style: headingStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            color: HexColor("#2D2C2C")),
                      ),
                      spaceH(7),
                      Text(
                        "SAR 12 will be added on COD",
                        style: headingStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 9.sp,
                            color: HexColor("#6A737C").withOpacity(0.6)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Radio(
                      value: 0,
                      groupValue: AppCubit.get(context).selectedCash,
                      onChanged: (value) {
                        AppCubit.get(context).selectedCash = 0;
                        AppCubit.get(context).cashSelection(selected: 0);
                        AppCubit.get(context).selectedVisa = null;
                        AppCubit.get(context).visaSelection(selected: null);
                        setState(() {
                          PaymentScreen.paymentMethod = 'cash_on_delivery';
                        });
                      })
                ],
              ),
              // spaceH(10),
              // Divider(
              //   thickness: 1,
              //   color: HexColor("#E3E1E1"),
              // ),
              // spaceH(10),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Image.asset("assets/images/Forma 1 copy 12.png"),
              //     spaceW(10),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text(
              //           LocaleKeys.Visa.tr(),
              //           style: headingStyle.copyWith(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 11.sp,
              //               color: HexColor("#2D2C2C")),
              //         ),
              //         spaceH(5),
              //         Text(
              //           ".... ...... ...... 567",
              //           style: headingStyle.copyWith(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 9.sp,
              //               color: HexColor("#6A737C").withOpacity(0.6)),
              //         ),
              //       ],
              //     ),
              //     const Spacer(),
              // Radio(
              //     value: 1,
              //     groupValue: AppCubit.get(context).selectedVisa,
              //     onChanged: (value) {
              //       AppCubit.get(context).selectedVisa = 1;
              //       AppCubit.get(context).visaSelection(selected: 1);
              //       AppCubit.get(context).selectedCash = null;
              //       AppCubit.get(context).cashSelection(selected: null);
              //       PaymentScreen.paymentMethod = 'master_card';
              //       Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => VisaScreen()));
              //     })
              //   ],
              // ),
            ],
          ),
        );
      },
      // child: ,
    );
  }
}
