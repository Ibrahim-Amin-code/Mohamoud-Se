// ignore_for_file: prefer_typing_uninitialized_variables

class SendOrderModel {
  bool? status;
  String? msg;
  Data? data;

  SendOrderModel({this.status, this.msg, this.data});

  SendOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? buyerId;
  var addressId;
  String? paymentMethod;
  int? id;

  Data({this.buyerId, this.addressId, this.paymentMethod, required this.id});

  Data.fromJson(Map<String, dynamic> json) {
    buyerId = json['buyerId'];
    addressId = json['addressId'];
    paymentMethod = json['payment_method'];
    id = json['id'];
  }
}
