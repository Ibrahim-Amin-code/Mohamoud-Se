class ClassReviewsModel {
  bool? status;
  String? msg;
  List<Data>? data;

  ClassReviewsModel({this.status, this.msg, this.data});

  ClassReviewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['msg'] = this.msg;
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Data {
  int? id;
  dynamic shopId;
  int? buyerId;
  int? productId;
  String? comment;
  String? rate;
  String? date;
  String? createdAt;
  String? updatedAt;
  Buyer? buyer;

  Data(
      {this.id,
        this.shopId,
        this.buyerId,
        this.productId,
        this.comment,
        this.rate,
        this.date,
        this.createdAt,
        this.updatedAt,
        this.buyer});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shopId'];
    buyerId = json['buyerId'];
    productId = json['productId'];
    comment = json['comment'];
    rate = json['rate'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    buyer = json['buyer'] != null ? new Buyer.fromJson(json['buyer']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['shopId'] = this.shopId;
  //   data['buyerId'] = this.buyerId;
  //   data['productId'] = this.productId;
  //   data['comment'] = this.comment;
  //   data['rate'] = this.rate;
  //   data['date'] = this.date;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   if (this.buyer != null) {
  //     data['buyer'] = this.buyer!.toJson();
  //   }
  //   return data;
  // }
}

class Buyer {
  int? id;
  int? countryId;
  int? cityId;
  dynamic stateID;
  String? name;
  String? email;
  dynamic dateOfBirth;
  String? mobile;
  String? photo;
  String? gender;
  String? detail;
  int? status;
  String? type;
  int? isActivated;
  String? token;
  String? deviceToken;
  dynamic createdAt;
  String? updatedAt;

  Buyer(
      {this.id,
        this.countryId,
        this.cityId,
        this.stateID,
        this.name,
        this.email,
        this.dateOfBirth,
        this.mobile,
        this.photo,
        this.gender,
        this.detail,
        this.status,
        this.type,
        this.isActivated,
        this.token,
        this.deviceToken,
        this.createdAt,
        this.updatedAt});

  Buyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['countryId'];
    cityId = json['cityId'];
    stateID = json['stateID'];
    name = json['name'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    mobile = json['mobile'];
    photo = json['photo'];
    gender = json['gender'];
    detail = json['detail'];
    status = json['status'];
    type = json['type'];
    isActivated = json['is_activated'];
    token = json['token'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['countryId'] = this.countryId;
  //   data['cityId'] = this.cityId;
  //   data['stateID'] = this.stateID;
  //   data['name'] = this.name;
  //   data['email'] = this.email;
  //   data['dateOfBirth'] = this.dateOfBirth;
  //   data['mobile'] = this.mobile;
  //   data['photo'] = this.photo;
  //   data['gender'] = this.gender;
  //   data['detail'] = this.detail;
  //   data['status'] = this.status;
  //   data['type'] = this.type;
  //   data['is_activated'] = this.isActivated;
  //   data['token'] = this.token;
  //   data['device_token'] = this.deviceToken;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }
}