import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/network/dio/dio_helper.dart';
import 'package:nib_app/network/end_points.dart';
import 'package:nib_app/screens/Authnitication/forgetPassword/cubit/states.dart';

import '../../auth.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  var data;

  String message = '';
  bool status = false;

  void userForgetPassword({
    required String email,
    required String lang,
  }) async {
    emit(ForgetPasswordLoadingState());
    String token = await CacheHelper.getData(key: 'token').toString();
    DioHelper.postDataForgetPassword(
      token: 'Bearer $token',
      data: {
        'email': email,
        'lang': lang,
      },
      url: ForgetPassword,
    ).then((value) async {
      data = value.data;
      message = data['msg'];
      status = data['status'];
      print(status);
      print(message);
      print(data);
      // print(data['msg']);
      emit(ForgetPasswordSuccessState());
    }).catchError((error) {
      emit(ForgetPasswordErrorState(error));
      print(
          'error----------------------------------------------${error.toString()}');
    });
  }

  void resetPassword({
    required oldPassword,
    required newPassword,
    required confirmPassword,
  }) async {
    emit(ResetPasswordLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    print(token);
    DioHelper.postDataForgetPassword(
      url: ChangePassword,
      data: {
        'old_password': oldPassword,
        'new_password': newPassword,
        'confirm_password': confirmPassword,
      },
      token: 'Bearer $token',
    ).then((value) {
      print(token);
      if (value.data['status'] == 200) {
        Fluttertoast.showToast(
            msg: value.data['message'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        print(
            'message 200 ---------------------------------------------------' +
                value.data['message']);
      } else if (value.data['status'] == false) {
        Fluttertoast.showToast(
            msg: value.data['msg'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        print(
            'message false ---------------------------------------------------' +
                value.data['msg']);
      } else if (value.data['status'] == 400) {
        Fluttertoast.showToast(
            msg: value.data['message'].toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.yellowAccent,
            textColor: Colors.white,
            fontSize: 16.0);
        print(
            'message 400 ---------------------------------------------------' +
                value.data['message']);
      }
      emit(ResetPasswordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ResetPasswordErrorState(error.toString()));
    });
  }
}
