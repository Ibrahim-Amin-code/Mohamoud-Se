// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nib_app/main.dart';
import 'package:nib_app/models/get_order_model.dart';
import 'package:nib_app/models/send_order_model.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/network/dio/dio_helper.dart';
import 'package:nib_app/network/end_points.dart';
import 'package:nib_app/screens/layout/layout_screen.dart';
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
    final String token = prefs.getString('token').toString();
    final String userID = prefs.getString('userID').toString();
    List<Map<String, dynamic>> productsOptions = [];
    for (var element in productId) {
      productsOptions.add({
        "id": element['id'],
        "quantity": 1,
        "currency": prefs.getString('price_k') ?? "\$",
        "price": element['price'],
      });
    }
    // var product = json.encode(productsOptions);
    print('productttttttttttttttttttttttttttttttttttttttttttt');

    // print(buyerId);

    var formData = FormData.fromMap({
      'lang': lang,
      "buyerId": userID,
      'addressId': addressId,
      'payment_method': paymentMethod,
      'productId': productsOptions,
    });
    print(formData);
    emit(SendOrderLoadingState());
    DioHelper.postOrderData(url: SendOrder, data: formData, token: token)
        .then((value) {
      print(value.data);
      if (value.statusCode == 200) {
        sendOrderModel = SendOrderModel.fromJson(value.data);
        if (paymentMethod == "master_card") {
          Fluttertoast.showToast(
            msg: "تم ارسال طلبك بنجاح",
            textColor: Colors.white,
            backgroundColor: Colors.green,
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT,
          );
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
          emit(SendOrderSuccessState());
        } else {
          Fluttertoast.showToast(
            msg: "تم ارسال طلبك بنجاح",
            textColor: Colors.white,
            backgroundColor: Colors.green,
            gravity: ToastGravity.CENTER,
            toastLength: Toast.LENGTH_SHORT,
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const LayoutScreen(index: 2)),
              (route) => false);
          emit(SendOrderSuccessState());
        }
      }
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
}
