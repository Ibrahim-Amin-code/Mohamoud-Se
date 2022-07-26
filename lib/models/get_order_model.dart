class GetOrderModel {
  bool? status;
  String? msg;
  List<Data>? data;

  GetOrderModel({this.status, this.msg, this.data});

  GetOrderModel.fromJson(Map<String, dynamic> json) {
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
  dynamic orderNumber;
  dynamic buyerId;
  dynamic vendorId;
  dynamic shopId;
  dynamic addressId;
  String? status;
  dynamic isPaid;
  String? paymentMethod;
  dynamic notes;
  dynamic billingFullname;
  dynamic billingAddress;
  dynamic billingCity;
  dynamic billingState;
  dynamic billingZipcode;
  dynamic billingPhone;
  String? createdAt;
  String? updatedAt;
  Address? address;
  List<Products>? products;

  Data(
      {this.id,
      this.orderNumber,
      this.buyerId,
      this.vendorId,
      this.shopId,
      this.addressId,
      this.status,
      this.isPaid,
      this.paymentMethod,
      this.notes,
      this.billingFullname,
      this.billingAddress,
      this.billingCity,
      this.billingState,
      this.billingZipcode,
      this.billingPhone,
      this.createdAt,
      this.updatedAt,
      this.address,
      this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    buyerId = json['buyerId'];
    vendorId = json['vendorId'];
    shopId = json['shopId'];
    addressId = json['addressId'];
    status = json['status'];
    isPaid = json['is_paid'];
    paymentMethod = json['payment_method'];
    notes = json['notes'];
    billingFullname = json['billing_fullname'];
    billingAddress = json['billing_address'];
    billingCity = json['billing_city'];
    billingState = json['billing_state'];
    billingZipcode = json['billing_zipcode'];
    billingPhone = json['billing_phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }
}

class Address {
  int? id;
  int? userId;
  String? addressName;
  String? fullName;
  String? email;
  String? phone;
  String? city;
  String? state;
  String? fullAddress;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Address(
      {this.id,
      this.userId,
      this.addressName,
      this.fullName,
      this.email,
      this.phone,
      this.city,
      this.state,
      this.fullAddress,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    addressName = json['address_name'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    city = json['city'];
    state = json['state'];
    fullAddress = json['full_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
}

class Products {
  int? id;
  dynamic categoryId;
  dynamic shopId;
  dynamic vendorId;
  Names? names;
  Names? descriptions;
  dynamic price;
  dynamic priceK;

  dynamic quantity;
  String? modalNumber;
  String? department;
  String? coverImg;

  dynamic status;
  dynamic date;
  String? size;
  String? color;
  dynamic createdAt;
  dynamic updatedAt;
  String? name;
  String? description;

  Products({
    this.id,
    this.categoryId,
    this.shopId,
    this.vendorId,
    this.names,
    this.descriptions,
    this.price,
    this.priceK,
    this.quantity,
    this.modalNumber,
    this.department,
    this.coverImg,
    this.status,
    this.date,
    this.size,
    this.color,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['categoryId'];
    shopId = json['shopId'];
    vendorId = json['vendorId'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
    descriptions = json['descriptions'] != null
        ? new Names.fromJson(json['descriptions'])
        : null;
    price = json['price'];
    price = json['price_k'];

    quantity = json['quantity'];
    modalNumber = json['modal_number'];
    department = json['department'];
    coverImg = json['cover_img'];

    status = json['status'];
    date = json['date'];
    size = json['size'];
    color = json['color'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    description = json['description'];
  }
}

class Names {
  String? ar;
  String? en;

  Names({this.ar, this.en});

  Names.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }
}
