class OffersModel {
  bool? status;
  String? msg;
  List<Data>? data;

  OffersModel({this.status, this.msg, this.data});

  OffersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;

  String? price;
  String? priceK;

  String? quantity;
  String? modalNumber;

  String? coverImg;

  // String? status;

  List<String>? size;
  List<String>? color;

  String? name;
  String? description;
  List<ProductImage>? productImage;
  Offer? offer;
  bool? wishlist;

  Data(
      {this.id,
      this.price,
      this.priceK,
      this.quantity,
      this.modalNumber,
      this.coverImg,
      // this.slug,
      // this.date,
      this.size,
      this.color,
      // this.createdAt,
      // this.updatedAt,
      this.name,
      this.description,
      this.productImage,
      this.offer,
      this.wishlist});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    priceK = json['price_k'];

    quantity = json['quantity'];
    modalNumber = (json['modal_number'] != null) ? json['modal_number'] : '';
    coverImg = json['cover_img'];
    size = json['size'].cast<String>();
    color = json['color'].cast<String>();
    name = json['name'];
    description = json['description'];
    if (json['product_image'] != null) {
      productImage = <ProductImage>[];
      json['product_image'].forEach((v) {
        productImage!.add(ProductImage.fromJson(v));
      });
    }
    offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
    wishlist = json['wishlist'];
  }
}

class ProductImage {
  int? id;
  String? image;

  ProductImage({
    this.id,
    this.image,
  });

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class Offer {
  int? id;
  String? productId;
  String? price;

  String? priceK;
  String? formDate;
  String? toDate;
  String? image;
  // String? createdAt;
  // String? updatedAt;

  Offer({
    this.id,
    this.productId,
    this.price,
    this.priceK,
    this.formDate,
    this.toDate,
    this.image,
  });

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    price = json['price'];
    price = json['price_k'];

    formDate = json['form_date'];
    toDate = json['to_date'];
    image = json['image'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }
}
