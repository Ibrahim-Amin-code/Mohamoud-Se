import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/cart/componnent/constant.dart';
import 'package:nib_app/screens/checkout/address/address.dart';
import 'package:nib_app/screens/checkout/checkout_cubit/checkout_cubit.dart';
import 'package:nib_app/screens/checkout/checkout_cubit/states.dart';
import 'package:nib_app/screens/checkout/componnent/body.dart';
import 'package:nib_app/screens/checkout/placeOrder.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/editAddress/editAddress.dart';
import 'package:nib_app/screens/layout/cubit/cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: use_key_in_widget_constructors
class UserAddress extends StatefulWidget {
  static String addressTitle = '';
  static String city = '';
  static String addressId = '';
  static String state = '';
  static String name = '';

  @override
  _UserAddressState createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ConditionalBuilder(
                condition: state is! CheckoutLoadingState,
                builder: (context) => ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 3.w),
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
                                  CheckoutCubit.get(context)
                                      .getAddressModel
                                      .data![index]
                                      .addressName
                                      .toString(),
                                  style: headingStyle.copyWith(
                                      color: HexColor("#4CB8BA"),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Radio(
                                    activeColor: HexColor("#4CB8BA"),
                                    value: index,
                                    groupValue:
                                        AppCubit.get(context).selectedItem,
                                    onChanged: (value) {
                                      AppCubit.get(context).selectedItem =
                                          index;
                                      AppCubit.get(context)
                                          .addressSelection(selected: index);
                                      setState(() {
                                        UserAddress.name =
                                            CheckoutCubit.get(context)
                                                .getAddressModel
                                                .data![index]
                                                .fullName
                                                .toString();
                                        UserAddress.addressTitle =
                                            CheckoutCubit.get(context)
                                                .getAddressModel
                                                .data![index]
                                                .addressName
                                                .toString();
                                        UserAddress.city =
                                            CheckoutCubit.get(context)
                                                .getAddressModel
                                                .data![index]
                                                .city
                                                .toString();
                                        UserAddress.state =
                                            CheckoutCubit.get(context)
                                                .getAddressModel
                                                .data![index]
                                                .state
                                                .toString();
                                        UserAddress.addressId =
                                            CheckoutCubit.get(context)
                                                .getAddressModel
                                                .data![index]
                                                .id
                                                .toString();
                                      });
                                    })
                              ],
                            ),
                            Text(
                              CheckoutCubit.get(context)
                                  .getAddressModel
                                  .data![index]
                                  .fullName
                                  .toString(),
                              style: headingStyle.copyWith(
                                  color: HexColor("#515C6F"),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              CheckoutCubit.get(context)
                                  .getAddressModel
                                  .data![index]
                                  .city
                                  .toString(),
                              style: headingStyle.copyWith(
                                  color: HexColor("#515C6F").withOpacity(0.5),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  CheckoutCubit.get(context)
                                      .getAddressModel
                                      .data![index]
                                      .state
                                      .toString(),
                                  style: headingStyle.copyWith(
                                      color: HexColor("#4CB8BA"),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditAddressScreen(
                                                      id: CheckoutCubit.get(
                                                              context)
                                                          .getAddressModel
                                                          .data![index]
                                                          .id
                                                          .toString(),
                                                    )));
                                        CheckoutCubit.get(context)
                                            .getAddresses();
                                      },
                                      child: Container(
                                        width: 15.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                            color: HexColor('#AA1050'),
                                            // gradient: LinearGradient(colors: [
                                            //   HexColor("#FF9000"),
                                            //   HexColor("#FFBE03")
                                            // ]),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: HexColor("#B5994565")
                                                      .withOpacity(0.2),
                                                  offset: const Offset(0, 3),
                                                  spreadRadius: 3,
                                                  blurRadius: 3)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(LocaleKeys.EDIT.tr(),
                                              style: headingStyle.copyWith(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ),
                                      ),
                                    ),
                                    spaceW(10),
                                    InkWell(
                                      onTap: () {
                                        CheckoutCubit.get(context)
                                            .deleteAddress(
                                          addressId: CheckoutCubit.get(context)
                                              .getAddressModel
                                              .data![index]
                                              .id
                                              .toString(),
                                        );
                                        CheckoutCubit.get(context)
                                            .getAddresses();
                                      },
                                      child: Container(
                                        width: 18.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                            color: HexColor("#2D2D2D"),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: HexColor("#B5994565")
                                                      .withOpacity(0.1),
                                                  offset: const Offset(0, 3),
                                                  spreadRadius: 3,
                                                  blurRadius: 3)
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Text(LocaleKeys.DELETE.tr(),
                                              style: headingStyle.copyWith(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => spaceH(10),
                    itemCount: CheckoutCubit.get(context)
                        .getAddressModel
                        .data!
                        .length),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ),
              spaceH(15),
              (CheckoutCubit.get(context).getAddressModel.data!.isNotEmpty)
                  ? placeOrderButton(
                      context: context,
                      title: LocaleKeys.Next.tr(),
                      press: () {
                        tabController!.animateTo(1,
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeInOut);
                      })
                  : Text(
                      LocaleKeys.Add_Address.tr(),
                    )
            ],
          ),
        );
      },
    );
  }
}
