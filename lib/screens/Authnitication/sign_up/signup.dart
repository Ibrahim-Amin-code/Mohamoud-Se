import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/Authnitication/pin_code/pin_code_screen.dart';
import 'package:nib_app/screens/Authnitication/sign_in/signIn_form.dart';
import 'package:nib_app/screens/Authnitication/sign_up/signup_cubit/cubit.dart';
import 'package:nib_app/screens/Authnitication/sign_up/signup_cubit/states.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/components/default_button.dart';
import 'package:sizer/sizer.dart';

import '../auth.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();

  // late String verificationId;
  // Future<void> _verifyPhone(context) async {
  //   print('this phone is: ${phone.text}');
  //   final PhoneCodeAutoRetrievalTimeout verificationFaild = (String verId) {
  //     this.verificationId = verId;
  //     // setState(() {
  //     //   SignInBody.id = verificationId;
  //     // });
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => PinCodeVerificationScreen(
  //                   phoneNumber: '${phone.text.toString()}',
  //                   verificationId: verificationId,
  //                 )),
  //         (route) => false);

  //     // Navigator.push(context,
  //     //     MaterialPageRoute(builder: (context) => PinCodeVerificationScreen
  //     //   (phoneNumber: '${phone.text.toString()}', verificationId: verificationId,)));

  //     print(
  //         "ccccccccccccccccccccccccccccccccccccccccccccccccccc : $verificationId");
  //   };

  //   final void Function(String verId, [int? forceCodeResend]) codeSent =
  //       (String verId, [int? forceCodeResend]) {
  //     this.verificationId = verId;
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => PinCodeVerificationScreen(
  //                   phoneNumber: '${phone.text.toString()}',
  //                   verificationId: verificationId,
  //                 )));
  //   };

  //   final PhoneVerificationCompleted verificationCompleted =
  //       (AuthCredential user) {
  //     print('the user data is: $user');
  //   };
  //   final PhoneVerificationFailed verificationFailed =
  //       (exception) => print('${exception.message}');
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: "+2" + phone.text,
  //       timeout: const Duration(seconds: 5),
  //       verificationCompleted: verificationCompleted,
  //       verificationFailed: verificationFailed,
  //       codeSent: codeSent,
  //       codeAutoRetrievalTimeout: verificationFaild);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (RegisterCubit.get(context).data['status'] == true) {
              print(
                  'signiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiin');
              Fluttertoast.showToast(
                  msg: RegisterCubit.get(context).data['msg'].toString(),
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
              // _verifyPhone(context);
            } else {
              Fluttertoast.showToast(
                  msg: RegisterCubit.get(context).data['msg'].toString(),
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        LocaleKeys.Welcome.tr(),
                        textAlign: TextAlign.start,
                        style: headingStyle.copyWith(
                            color: HexColor("#AEAEAE"),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  nameTextfield(validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return LocaleKeys.PleaseEnter.tr();
                    }
                  }),
                  SizedBox(
                    height: 3.h,
                  ),
                  phoneTextfield(validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return LocaleKeys.PleaseEnter.tr();
                    }
                  }),
                  SizedBox(
                    height: 3.h,
                  ),
                  emailTextfield(validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return LocaleKeys.PleaseEnter.tr();
                    }
                  }),
                  SizedBox(
                    height: 3.h,
                  ),
                  passwordfield(validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return LocaleKeys.PleaseEnter.tr();
                    }
                  }),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultButton(
                    press: () {
                      if (formKey.currentState!.validate()) {
                        RegisterCubit.get(context).userRegister(
                          context: context,
                          email: email.text.toString(),
                          password: pass.text.toString(),
                          name: name.text.toString(),
                          mobile: phone.text.toString(),
                        );
                        // RegisterCubit.get(context).firebaseUserRegister(
                        //     email: email.text.toString().trim(),
                        //     password: pass.text.toString());
                      }
                    },
                    text: LocaleKeys.SignUp.tr(),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  nameTextfield({
    required FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: name,
      validator: validator,
      keyboardType: TextInputType.text,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          hintText: LocaleKeys.Full_Name.tr(),
          hintStyle: headingStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: HexColor("#7E7E7E")),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: HexColor("#707070A6")))),
    );
  }

  emailTextfield({
    required FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: email,
      validator: validator,
      keyboardType: TextInputType.text,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          hintText: LocaleKeys.Email.tr(),
          hintStyle: headingStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: HexColor("#7E7E7E")),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: HexColor("#707070A6")))),
    );
  }

  phoneTextfield({
    required FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: phone,
      validator: validator,
      keyboardType: TextInputType.phone,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          hintText: LocaleKeys.Phone.tr(),
          hintStyle: headingStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: HexColor("#7E7E7E")),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: HexColor("#707070A6")))),
    );
  }

  passwordfield({
    required FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: pass,
      validator: validator,
      obscureText: true,
      keyboardType: TextInputType.text,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          hintText: LocaleKeys.Password.tr(),
          hintStyle: headingStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: HexColor("#7E7E7E")),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: HexColor("#707070A6")))),
    );
  }
}
