// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/constants.dart';

class SplashBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 300,
            width: 300,
            // decoration:  BoxDecoration(
            //   gradient: LinearGradient(
            //       colors: [HexColor('#40A2A6'),HexColor('#4CB8BA')]),
            //     // shape: BoxShape.circle,
            //     // color: Colors.white,
            // ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                'assets/images/This-01.png',
                color: Colors.white,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
