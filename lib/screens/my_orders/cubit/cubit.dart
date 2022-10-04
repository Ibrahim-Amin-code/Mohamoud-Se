// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/main.dart';
import 'package:nib_app/models/get_address_model.dart';
import 'package:nib_app/models/get_order_model.dart';
import 'package:nib_app/models/send_order_model.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/network/dio/dio_helper.dart';
import 'package:nib_app/network/end_points.dart';
import 'package:nib_app/screens/cart/componnent/body.dart';
import 'package:nib_app/screens/layout/cubit/cubit.dart';
import 'package:nib_app/screens/my_orders/cubit/states.dart';
import 'package:nib_app/screens/my_orders/orderSuccess/orderSuccess.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitialState());

  static OrderCubit get(context) => BlocProvider.of(context);

  GetOrderModel getOrderModel = GetOrderModel();
  List orders = [];

  void getOrders() async {
    emit(OrderLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    try {
      var response = await http.get(
        Uri.parse(
            'http://beautiheath.com/sub/eshop/api/buyers/get-buyer-order'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      orders.clear();
      getOrderModel = GetOrderModel.fromJson(json.decode(response.body));
      var data = json.decode(response.body);
      orders.addAll(data['data']);
      print(
          'wishListModel----------------------------------------------------------------------------------' +
              response.body);
      emit(OrderSuccessState());
    } catch (error) {
      print(error.toString());

      emit(OrderErrorState(error.toString()));
    }
  }

  SendOrderModel sendOrderModel = SendOrderModel();

  void sendOrder({
    required String addressId,
    required String paymentMethod,
    required List productId,
    required context,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String lang = preferences.getString('lang') ?? 'en';
    String token = await CacheHelper.getData(key: 'token');
    List<Map<String, dynamic>> productsOptions = [];
    productId.forEach((element) {
      productsOptions.add({
        "id": element['id'],
        "quantity": 2,
        "currency": prefs.getString('price_k') ?? "\$",
        "price": element['price'],
      });
    });
    // var product = json.encode(productsOptions);
    print('productttttttttttttttttttttttttttttttttttttttttttt');

    // print(buyerId);

    var formData = FormData.fromMap({
      'lang': lang,
      'addressId': addressId,
      'payment_method': paymentMethod,
      'productId': productsOptions,
    });
    print(formData);
    emit(SendOrderLoadingState());
    DioHelper.postOrderData(url: SendOrder, data: formData, token: token)
        .then((value) {
      sendOrderModel = SendOrderModel.fromJson(value.data);

      print(value.data);
      // CacheHelper.saveData(
      //     key: 'orderId', value: sendOrderModel.data!.id.toString());
      emit(SendOrderSuccessState());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderSuccessScreen(
                    orderId: OrderCubit.get(context)
                        .sendOrderModel
                        .data
                        ?.id
                        .toString(),
                    token: token,
                  )));
    }).catchError((error) {
      print(error.toString());
      emit(SendOrderErrorState(error.toString()));
    });
  }

  void deleteOrder({
    required String orderId,
  }) async {
    emit(DeleteOrderLoadingState());
    DioHelper.postData(
            url: DeleteOrder,
            data: {
              'orderId': orderId,
              'status': 'delete',
            },
            token: prefs.getString('token').toString())
        .then((value) {
      print(value.data);
      print(prefs.getString('token').toString());
      emit(DeleteOrderSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DeleteOrderErrorState(error.toString()));
    });
  }

  // void register({
  //   required String email,
  //   required String username,
  //   required String password,
  // }) {
  //   String basicAuth =
  //       'Basic ' + base64Encode(utf8.encode('api:fzV(v6*H0p0TkigB^Gp9AeD&'));
  //   print(basicAuth);
  //   FormData formData = FormData.fromMap({
  //     "email": email,
  //     "username": username,
  //     "password": password,
  //   });
  //   emit(RegisterLoadingState());
  //   DioHelper.postData(
  //     url: EndPoints.Register_URL,
  //     data: formData,
  //     headers: {'authorization': basicAuth},
  //   ).then((value) {
  //     print(value.data);
  //     CacheHelper.saveData(key: 'username', value: value.data['name'].toString());
  //     emit(RegisterSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(RegisterErrorState(error.toString()));
  //   });
  // }

}
