import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nib_app/models/login_model.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/network/dio/dio_helper.dart';
import 'package:nib_app/network/end_points.dart';
// import 'package:nib_app/screens/Authnitication/login_cubit/states.dart';
import 'package:nib_app/screens/Authnitication/sign_in/login_cubit/states.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel = LoginModel();

  //http://beautiheath.com/sub/eshop/api/buyers/register

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      data: {
        'email': email,
        'password': password,
        "device_token": 'fwfwfrw',
      },
      url: Login,
    ).then((value) async {
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(value: loginModel.data!.token, key: 'token') ?? '';
      CacheHelper.saveData(value: loginModel.data!.name, key: 'username');
      CacheHelper.saveData(
          value: loginModel.data!.id.toString(), key: 'userID');
      print(
          '========================================================= ${loginModel.msg}=');
      print(
          '========================================================= ${loginModel.data!.token}=');
      print(
          '========================================================= ${loginModel.data!.id}=');

      emit(LoginSuccessState());
    }).catchError((error) {
      print(email.toString());
      print(password.toString());
      emit(LoginErrorState(error.toString()));
      print(
          'error----------------------------------------------${error.toString()}');
    });
  }

//////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////

  // final FirebaseAuth auth = FirebaseAuth.instance;

  // Future<void> signup(BuildContext context) async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   final GoogleSignInAccount? googleSignInAccount =
  //       await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);

  //     // Getting users credential
  //     UserCredential result = await auth.signInWithCredential(authCredential);
  //     User? user = result.user;

  //     if (result != null) {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => LayoutScreen(index: 0)));
  //     } // if result not null we simply call the MaterialpageRoute,
  //     // for go to the HomePage screen
  //   }
  // }
}
