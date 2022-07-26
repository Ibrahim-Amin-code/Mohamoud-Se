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
          child: Container(
            height: 200,
            width: 200,
            // decoration:  BoxDecoration(
            //   gradient: LinearGradient(
            //       colors: [HexColor('#40A2A6'),HexColor('#4CB8BA')]),
            //     // shape: BoxShape.circle,
            //     // color: Colors.white,
            // ),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'M',
                style: headingStyle.copyWith(
                  color: Colors.white,
                  fontSize: 80,
                  fontFamily: 'Satisfy',
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
          ),
        ),
      ],
    );
  }
}
