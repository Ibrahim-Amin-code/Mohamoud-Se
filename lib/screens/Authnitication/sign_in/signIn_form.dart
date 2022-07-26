import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/Authnitication/forgetPassword/forget_password.dart';
import 'package:nib_app/screens/Authnitication/sign_in/login_cubit/cubit.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/components/default_button.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'login_cubit/cubit.dart';
import 'login_cubit/states.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (LoginCubit.get(context).loginModel.status == true) {
          // print(LoginCubit.get(context).loginModel.data!.token);
          Fluttertoast.showToast(
              msg: LoginCubit.get(context).loginModel.msg.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const LayoutScreen(index: 2)),
              (route) => false);
        } else if (LoginCubit.get(context).loginModel.status == false) {
          Fluttertoast.showToast(
              msg: LoginCubit.get(context).loginModel.msg.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // SizedBox(height: 1.h,),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    LocaleKeys.Welcome.tr(),
                    textAlign: TextAlign.start,
                    style: headingStyle.copyWith(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                phoneEmailTextfield(validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return LocaleKeys.PleaseEnter.tr();
                  }
                }),
                SizedBox(
                  height: 2.h,
                ),
                passwordTextfield(validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return LocaleKeys.PleaseEnter.tr();
                  }
                }),
                SizedBox(
                  height: 1.5.h,
                ),
                // ignore: prefer_const_constructors
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordScreen()));
                    },
                    child: Text(
                      LocaleKeys.Forget_Password.tr(),
                      style: headingStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: HexColor("#515C6F")),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                DefaultButton(
                  press: () {
                    if (formKey.currentState!.validate()) {
                      LoginCubit.get(context).userLogin(
                        email: email.text.toString(),
                        password: pass.text.toString(),
                      );
                    }
                  },
                  text: LocaleKeys.Log_In.tr(),
                ),
              ],
            ),
          ),
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
      keyboardType: TextInputType.text,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
          hintText: LocaleKeys.Username_or_email.tr(),
          hintStyle: headingStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: HexColor("#7E7E7E")),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: HexColor("#707070A6")))),
    );
  }

  passwordTextfield({
    required FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: pass,
      obscureText: true,
      validator: validator,
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
