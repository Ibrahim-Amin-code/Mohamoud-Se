import 'package:flutter/material.dart';
import 'package:nib_app/screens/components/constants.dart';

import 'componnent/body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor('#AA1050'),
        // gradient: LinearGradient(
        //     colors: [HexColor("#40A2A6"), HexColor("#4CB8BA")])
      ),
      // ignore: prefer_const_constructors
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: const ForgetPassBody(),
      ),
    );
  }
}
