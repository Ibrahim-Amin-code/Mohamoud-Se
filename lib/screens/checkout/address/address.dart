import 'package:flutter/material.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/addAddress/addAddress.dart';
import 'package:nib_app/screens/checkout/address/userAddresses.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: use_key_in_widget_constructors
class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Center(
            child: Container(
              height: 6.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: HexColor('#AA1050'))),
              child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: HexColor("#333333"),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: HexColor('#AA1050')),
                  unselectedLabelStyle: headingStyle.copyWith(
                      fontSize: 11.sp,
                      color: HexColor("#333333"),
                      fontWeight: FontWeight.w400),
                  labelStyle: headingStyle.copyWith(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  tabs: [
                    Text(LocaleKeys.Saved_Address.tr()),
                    Text(LocaleKeys.New_Address.tr()),
                  ]),
            ),
          ),
          spaceH(20),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.85,
            child: TabBarView(
              controller: _tabController,
              children: [
                UserAddress(),
                AddNewaddressScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
