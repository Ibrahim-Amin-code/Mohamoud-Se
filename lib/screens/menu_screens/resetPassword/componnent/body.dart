import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/generated/locale_keys.dart';
import 'package:nib_app/screens/Authnitication/forgetPassword/cubit/cubit.dart';
import 'package:nib_app/screens/Authnitication/forgetPassword/cubit/states.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/components/default_button.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class ResetPasswordBody extends StatefulWidget {
  @override
  _ResetPasswordBodyState createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  final formKey = GlobalKey<FormState>();
  TextEditingController currentPass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView(
          primary: true,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
          children: [
            Text(
              LocaleKeys.Current_Password.tr(),
              style: headingStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#7E7E7E")),
            ),
            spaceH(15),
            customTextField(
                title: LocaleKeys.Current_Password.tr(),
                controller: currentPass,
                type: TextInputType.text,
                secure: true),
            spaceH(15),
            Text(
              LocaleKeys.New_Password.tr(),
              style: headingStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#7E7E7E")),
            ),
            spaceH(15),
            customTextField(
                title: LocaleKeys.New_Password.tr(),
                controller: newpass,
                type: TextInputType.text,
                secure: true),
            spaceH(15),
            Text(
              LocaleKeys.Confirm_Password.tr(),
              style: headingStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: HexColor("#7E7E7E")),
            ),
            spaceH(15),
            customTextField(
                title: LocaleKeys.Confirm_Password.tr(),
                controller: confirmpass,
                type: TextInputType.text,
                secure: true),
            spaceH(30),
            DefaultButton(
              text: LocaleKeys.Change_Password.tr(),
              press: () {
                ForgetPasswordCubit.get(context).resetPassword(
                  oldPassword: currentPass.text.toString(),
                  newPassword: newpass.text.toString(),
                  confirmPassword: confirmpass.text.toString(),
                );
              },
            )
          ],
        );
      },
    );
  }
}
