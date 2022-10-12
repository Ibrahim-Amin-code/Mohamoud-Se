import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/screens/Authnitication/forgetPassword/cubit/cubit.dart';
import 'package:nib_app/screens/Authnitication/forgetPassword/cubit/states.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/components/default_button.dart';
import 'package:nib_app/screens/menu_screens/resetPassword/resetPass.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgetPassBody extends StatefulWidget {
  const ForgetPassBody({Key? key}) : super(key: key);

  @override
  _ForgetPassBodyState createState() => _ForgetPassBodyState();
}

class _ForgetPassBodyState extends State<ForgetPassBody> {
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          Fluttertoast.showToast(
              msg: ForgetPasswordCubit.get(context).message.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ResetPasswordScreen()));
        } else if (state is ForgetPasswordErrorState) {
          Fluttertoast.showToast(
              msg: ForgetPasswordCubit.get(context).message.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return ListView(
          primary: true,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 3.w),
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
                spaceH(40),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Text(
                            LocaleKeys.Forget_Password.tr(),
                            style: headingStyle.copyWith(
                              color: HexColor("#4CB8BA"),
                              fontSize: 18.sp,
                              // fontFamily: 'Satisfy',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5.w),
                          width: 39,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: HexColor("#4CB8BA"),
                          ),
                        ),
                        spaceH(15),
                        const Divider(),
                        SizedBox(
                          // width: 50.h,
                          child: Text(
                            LocaleKeys.TitlePassword.tr(),
                            textAlign: TextAlign.start,
                            maxLines: 4,
                            style: headingStyle.copyWith(
                                color: HexColor('#AEAEAE'),
                                // fontFamily: 'OpenSans',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        spaceH(30),
                        phoneEmailTextfield(validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return LocaleKeys.PleaseEnter.tr();
                          }
                        }),
                        spaceH(30),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: DefaultButton(
                                text: LocaleKeys.Change_Password.tr(),
                                press: () {
                                  ForgetPasswordCubit.get(context)
                                      .userForgetPassword(
                                    email: email.text.toString(),
                                    lang: 'ar',
                                  );
                                }))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  phoneEmailTextfield({
    required FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: email,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          hintText: LocaleKeys.Email.tr(),
          hintStyle: headingStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: HexColor("#7E7E7E")),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: HexColor("#707070A6")))),
    );
  }
}
