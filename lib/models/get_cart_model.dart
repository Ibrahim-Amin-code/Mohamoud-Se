// class CartModel {
//   bool? status;
//   String? msg;
//   List<Data>? data;
//
//   CartModel({this.status, this.msg, this.data});
//
//   CartModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     msg = json['msg'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
// }
//
// class Data {
//     late  int id;
//     late String name;
//     late int price;
//     late String coverImg;
//
//
//   Data({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.coverImg,
//     });
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name']??"";
//     price = json['price'];
//     coverImg = json['cover_img']??"";
//   }
//
// }
//
// // class ProductImage {
// //   int? id;
// //   int? productId;
// //   String? image;
// //   dynamic createdAt;
// //   dynamic updatedAt;
// //
// //   ProductImage(
// //       { this.id, this.productId, this.image, this.createdAt, this.updatedAt});
// //
// //   ProductImage.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     productId = json['productId'];
// //     image = json['image'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }
// //
// //   // Map<String, dynamic> toJson() {
// //   //   final Map<String, dynamic> data = new Map<String, dynamic>();
// //   //   data['id'] = this.id;
// //   //   data['productId'] = this.productId;
// //   //   data['image'] = this.image;
// //   //   data['created_at'] = this.createdAt;
// //   //   data['updated_at'] = this.updatedAt;
// //   //   return data;
// //   // }
// // }