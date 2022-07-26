class GetAddressModel {
  bool? status;
  String? msg;
  List<Data>? data;

  GetAddressModel({this.status, this.msg, this.data});

  GetAddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

}

class Data {
  int? id;
  int? userId;
  String? addressName;
  String? fullName;
  String? email;
  String? phone;
  String? city;
  String? state;
  String? fullAddress;

  Data(
      {this.id,
        this.userId,
        this.addressName,
        this.fullName,
        this.email,
        this.phone,
        this.city,
        this.state,
        this.fullAddress,
        });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    addressName = json['address_name'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    state = json['state'];
    fullAddress = json['full_address'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
  }

}