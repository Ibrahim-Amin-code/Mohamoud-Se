import 'package:flutter/material.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/Authnitication/sign_in/signIn_form.dart';
import 'package:nib_app/screens/Authnitication/sign_up/signup.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

int currentIndex = 0;

class AuthniticationBody extends StatefulWidget {
  const AuthniticationBody({Key? key}) : super(key: key);

  @override
  _AuthniticationBodyState createState() => _AuthniticationBodyState();
}

class _AuthniticationBodyState extends State<AuthniticationBody> {
  List<String> contText = [
    "SIGN IN",
    "SIGN UP",
  ];
  var loading = false;

  bool isTapped = true;
  List<Widget> screens = [const SignInForm(), const SignupForm()];

  Map userObj = {};

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: true,
      shrinkWrap: true,
      // padding: EdgeInsets.symmetric(vertical: 5.h),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset(
                'assets/images/This-01.png',
                color: Colors.white,
                width: 150,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        contText.length, (index) => buildDot(index: index)),
                  )),
                  const Divider(),
                  SizedBox(
                    height: 40.h,
                    child: screens[currentIndex],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(
              child: Text(
                LocaleKeys.Don_have_an_account.tr(),
                style: headingStyle.copyWith(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Text(
                LocaleKeys.Signup_big_lable.tr(),
                style: headingStyle.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            const Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LayoutScreen(index: 0)));
                    },
                    child: Text(
                      LocaleKeys.Skip.tr(),
                      style: headingStyle.copyWith(
                          color: HexColor("#C1E9F7"),
                          fontWeight: FontWeight.w400,
                          fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      ],
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 40,
      width: currentIndex == index ? 100 : 100,
      decoration: BoxDecoration(
          color: currentIndex == index ? HexColor('#AA1050') : Colors.white),
      child: InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: Center(
            child: Text(
              contText[index],
              style: headingStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: (currentIndex == index) ? Colors.white : Colors.black),
            ),
          )),
    );
  }
}
