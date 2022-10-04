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
  int? addressId;
  String? paymentMethod;
  String? updatedAt;
  String? createdAt;
  late int id;

  Data(
      {this.buyerId,
      this.addressId,
      this.paymentMethod,
      this.updatedAt,
      this.createdAt,
      required this.id});

  Data.fromJson(Map<String, dynamic> json) {
    buyerId = json['buyerId'];
    addressId = json['addressId'];
    paymentMethod = json['payment_method'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
