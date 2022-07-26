import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/checkout/address/address.dart';
import 'package:nib_app/screens/components/constants.dart';

import '../../cart/componnent/constant.dart';
import '../payment.dart';
import '../placeOrder.dart';
import 'package:sizer/sizer.dart';

TabController? tabController;

// ignore: use_key_in_widget_constructors
class CheckoutBody extends StatefulWidget {
  @override
  _CheckoutBodyState createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 7.h,
            color: Colors.black,
            child: TabBar(
              controller: tabController,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.white,
              indicator: BoxDecoration(
                color: HexColor('#AA1050'),
                borderRadius: BorderRadius.circular(1),
                // gradient: LinearGradient(
                //     colors: [HexColor("#FF9000"), HexColor("#FFBE03")]),
              ),
              tabs: [
                Image.asset(
                  "assets/images/location.png",
                  color: Colors.white,
                ),
                Image.asset(
                  "assets/images/Giftbox-Hands-Purchase-Buy-Commerce.png",
                  color: Colors.white,
                ),
                Image.asset(
                  "assets/images/credit-card.png",
                  color: Colors.white,
                ),
              ],
            )),
        // ignore: prefer_const_constructors
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: TabBarView(
                controller: tabController,
                children: [AddressScreen(), PlaceOrder(), PaymentScreen()])),
      ],
    );
  }
}
