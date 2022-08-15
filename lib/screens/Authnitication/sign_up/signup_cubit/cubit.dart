import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/models/login_model.dart';
import 'package:nib_app/network/dio/dio_helper.dart';
import 'package:nib_app/network/end_points.dart';
// import 'package:nib_app/screens/Authnitication/login_cubit/states.dart';
import 'package:nib_app/screens/Authnitication/sign_in/login_cubit/states.dart';
import 'package:nib_app/screens/Authnitication/sign_in/signIn_form.dart';
import 'package:nib_app/screens/Authnitication/sign_up/signup_cubit/states.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';

import '../../auth.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  // String message ='';
  // bool status = false;
  var data;

  void userRegister({
    context,
    required String email,
    required String password,
    required String name,
    required String mobile,
  }) {
    emit(RegisterLoadingState());

    DioHelper.postData(
      data: {
        'email': email,
        'name': name,
        'password': password,
        'mobile': mobile,
      },
      url: Register,
    ).then((value) async {
      data = value.data;
      print('------------------------------------------------------------' +
          data['msg']);
      print('------------------------------------------------------------' +
          data['status'].toString());
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print(
          'error----------------------------------------------${error.toString()}');
    });
  }

  // void firebaseUserRegister({
  //   context,
  //   required String email,
  //   required String password,
  // }) {
  //   print('hello');
  //   emit(FirebaseRegisterLoadingState());
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((value) {
  //     print(value.user!.email);
  //     print(value.user!.uid);
  //   }).catchError((error) {
  //     emit(FirebaseRegisterErrorState(error.toString()));
  //     print(error.toString());
  //   });
  // }
}
