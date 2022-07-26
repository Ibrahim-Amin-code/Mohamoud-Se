import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nib_app/models/get_address_model.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/network/dio/dio_helper.dart';
import 'package:nib_app/network/end_points.dart';
import 'package:nib_app/screens/checkout/checkout_cubit/states.dart';
import 'package:nib_app/screens/components/constants.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitialState());

  static CheckoutCubit get(context) => BlocProvider.of(context);

  GetAddressModel getAddressModel = GetAddressModel();

  // List addressesData=[];

  void getAddresses() async {
    emit(CheckoutLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    String userID = await CacheHelper.getData(key: 'userID');
    DioHelper.getData(
      url: GetAddresses,
      query: {
        'buyerId': userID,
      },
      token: 'Bearer $token',
    ).then((value) {
      getAddressModel = GetAddressModel.fromJson(value.data);
      print(value.data);
      print('userrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' + userID.toString());
      emit(CheckoutSuccessState());
    }).catchError((error) {
      emit(CheckoutErrorState(error.toString()));
      print(error.toString());
    });
  }

  void addAddress({
    required String addressName,
    required String addressId,
    required String fullAddress,
    required String fullName,
    required String email,
    required String phone,
    required String city,
    required String state,
  }) async {
    emit(AddAddressLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    DioHelper.postData(
      url: AddAddress,
      token: 'Bearer $token',
      data: {
        'addressId': addressId,
        'address_name': addressName,
        'full_address': fullAddress,
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'city': city,
        'state': state,
      },
    ).then((value) {
      print(value.data);
      Fluttertoast.showToast(
          msg: value.data['msg'].toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: HexColor('#727C8E'),
          fontSize: 16.0);
      emit(AddAddressSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddAddressErrorState(error.toString()));
    });
  }

  void deleteAddress({required String addressId}) {
    emit(DeleteAddressLoadingState());
    DioHelper.postData(url: DeleteAddress, data: {'addressId': addressId})
        .then((value) {
      print(
          'deleteAddress---------------------------------------- ${value.data}');
      emit(DeleteAddressSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteAddressErrorState(error.toString()));
    });
  }
}
