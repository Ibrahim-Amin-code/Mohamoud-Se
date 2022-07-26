import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/home/home_component/home_component.dart';
import 'package:nib_app/screens/my_orders/cubit/cubit.dart';
import 'package:nib_app/screens/my_orders/cubit/states.dart';
import 'package:sizer/sizer.dart';

import 'my_order_component/component.dart';
import 'package:easy_localization/easy_localization.dart';

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F5F6F8'),
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.4),
          child: Container(
            color: HexColor('#AA1050'),
            // color: Colors.orange,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 1.5.h),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white.withOpacity(0.8),
                    size: 26,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    LocaleKeys.My_Orders.tr(),
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )),
      body: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state is! OrderLoadingState,
            builder: (context) => ListView.separated(
              itemBuilder: (context, index) => buildMyOrderCardItem(
                paymentMethod: OrderCubit.get(context)
                    .orders[index]['payment_method']
                    .toString(),
                price: OrderCubit.get(context).orders[index]['products'],
                details: OrderCubit.get(context).orders[index],
                context: context,
                itemsNum: OrderCubit.get(context)
                    .orders[index]['products']
                    .length
                    .toString(),
                date: OrderCubit.get(context)
                    .orders[index]['created_at']
                    .toString()
                    .substring(0, 10)
                    .toString(),
                orderNum:
                    OrderCubit.get(context).orders[index]['id'].toString(),
                orderStatus:
                    OrderCubit.get(context).orders[index]['status'].toString(),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 3.h,
              ),
              itemCount: OrderCubit.get(context).orders.length,
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
              ),
              physics: BouncingScrollPhysics(),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
        // child: ,
      ),
    );
  }
}
