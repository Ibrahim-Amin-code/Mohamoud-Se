import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
import 'package:nib_app/screens/my_orders/cubit/cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:nib_app/screens/components/constants.dart';
import '../../cubit/states.dart';
import 'constant.dart';
import 'orderCard.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: use_key_in_widget_constructors
class OrderDetailBody extends StatefulWidget {
  final dynamic details;

  const OrderDetailBody({Key? key, required this.details}) : super(key: key);

  @override
  _OrderDetailBodyState createState() => _OrderDetailBodyState();
}

class _OrderDetailBodyState extends State<OrderDetailBody> {
  String lang = '';
  getLang() async {
    final String data = await CacheHelper.getData(key: 'lang') ?? '';
    setState(() {
      lang = data;
    });
  }

  @override
  void initState() {
    this.getLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      children: [
        orderCardDetail(
          paymentMethod: widget.details['payment_method'].toString(),
          //OrderCubit.get(context).orders[index]['products']
          itemsNum: widget.details['products'].length.toString(),
          date: widget.details['created_at']
              .toString()
              .substring(0, 10)
              .toString(),
          orderNum: widget.details['id'].toString(),
          orderStatus:  widget.details['status'].toString(),
          price: widget.details['products'],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.Items.tr(),
                  style: headingStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "(${widget.details['products'].length.toString()})",
                  style: headingStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#C9C9C9")),
                ),
              ],
            ),
            Text(
              LocaleKeys.Invoice.tr(),
              style: headingStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: HexColor("#000000").withOpacity(0.5)),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        ListView.separated(
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) => productOrderDetail(
                context: context,
                image:
                    widget.details['products'][index]['cover_img'].toString(),
                productName:
                    widget.details['products'][index]['name'].toString(),
                price: widget.details['products'][index]['price'].toString(),
                qty: widget.details['products'][index]['quantity'].toString()),
            separatorBuilder: (context, index) => spaceH(10),
            itemCount: widget.details['products'].length),
        SizedBox(
          height: 3.h,
        ),
        Text(
          LocaleKeys.Summary_Details.tr(),
          style: headingStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        SizedBox(
          height: 2.h,
        ),
        paymentDetail(widget.details['products']),
        SizedBox(
          height: 2.h,
        ),
        deliverTime(),
        spaceH(15),
        BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state is DeleteOrderSuccessState) {
              OrderCubit.get(context).getOrders();
              Fluttertoast.showToast(
                  msg: 'Order Deleted',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LayoutScreen(index: 2)));
            } else if (state is DeleteOrderErrorState) {
              Fluttertoast.showToast(
                  msg: 'Order Not Deleted',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);

            }
          },
          builder: (context, state) {
            return (widget.details['status']!='delete')? cancelOrderButton(
                press: () {
                  OrderCubit.get(context)
                      .deleteOrder(orderId: widget.details['id'].toString());
                },
                title: LocaleKeys.Order_Cancel.tr()) : SizedBox();
          },
        ),
        SizedBox(
          height: 2.h,
        ),
        //"address": {
        //                 "id": 3,
        //                 "userId": 74,
        //                 "address_name": "egypt",
        //                 "full_name": "ibrahim amin",
        //                 "email": "user@user.com",
        //                 "phone": "01022952483",
        //                 "city": "metghamer",
        //                 "state": "elmansoura",
        //                 "full_address": "cairo",
        //                 "created_at": "2022-01-30T20:58:24.000000Z",
        //                 "updated_at": "2022-01-30T20:58:24.000000Z",
        //                 "deleted_at": null
        deliverAddress(
          addressId: widget.details['address']['id'].toString(),
          state: widget.details['address']['state'].toString(),
          fullName: widget.details['address']['full_name'].toString(),
          fullAddress: widget.details['address']['full_address'].toString(),
          addressName: widget.details['address']['address_name'].toString(),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
