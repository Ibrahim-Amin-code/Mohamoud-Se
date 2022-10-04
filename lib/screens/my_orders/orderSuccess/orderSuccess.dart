import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:webview_flutter/webview_flutter.dart';

trackOrderButton(context) {
  return InkWell(
    onTap: () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LayoutScreen(index: 2)),
          (route) => false);
    },
    child: Container(
      height: 7.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: HexColor('#AA1050'),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: HexColor("#B5994565").withOpacity(0.1),
              offset: const Offset(0, 3),
              spreadRadius: 3,
              blurRadius: 3)
        ],
        // gradient: LinearGradient(
        //     colors: [HexColor("#FF9000"), HexColor("#FFBE03")])
      ),
      child: Center(
        child: Text(LocaleKeys.Track.tr(),
            style: headingStyle.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
      ),
    ),
  );
}

class OrderSuccessScreen extends StatefulWidget {
  final String token;
  final dynamic orderId;

  const OrderSuccessScreen(
      {Key? key, required this.token, required this.orderId})
      : super(key: key);

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_constructors
        body: Padding(
      padding: const EdgeInsets.only(top: 50),
      child: WebView(
        initialUrl:
            'http://beautiheath.com/sub/eshop/get-checkout/${widget.token}/${widget.orderId}/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ));
  }
}
