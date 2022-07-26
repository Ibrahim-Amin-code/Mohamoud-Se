class WishListModel {
  bool? status;
  String? msg;
  List<Data>? data;

  WishListModel({this.status, this.msg, this.data});

  WishListModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  List<String>? size;
  List<String>? color;
  String? name;
  String? description;
  List<ProductImage>? productImage;
  bool? wishlist;

  Data(
      {this.id,
      this.price,
      this.priceK,
      this.quantity,
      this.modalNumber,
      this.coverImg,
      this.status,
      this.size,
      this.color,
      this.name,
      this.description,
      this.productImage,
      this.wishlist});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    price = json['price'];
    priceK = json['price_k'];

    quantity = json['quantity'];
    modalNumber = json['modal_number'];

    coverImg = json['cover_img'];

    status = json['status'];

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
    wishlist = json['wishlist'];
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
