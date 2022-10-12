import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nib_app/models/all_offers.dart';
import 'package:nib_app/models/contact_model.dart';
import 'package:http/http.dart' as http;
import 'package:nib_app/models/get_products_model.dart';
import 'package:nib_app/models/reviews_model.dart';
import 'package:nib_app/models/wish_list_model.dart';
import 'package:nib_app/network/cache/cache_helper.dart';
import 'package:nib_app/network/dio/dio_helper.dart';
import 'package:nib_app/network/end_points.dart';
import 'package:nib_app/screens/components/constants.dart';
import 'package:nib_app/screens/home/home_cubit/states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List data = [];

  void getShops() {
    emit(HomeLoadingState());
    DioHelper.getData(
      url: GetShops,
    ).then((value) {
      data.clear();
      data.addAll(value.data['data']);
      emit(HomeSuccessState());
    }).catchError((error) {
      emit(HomeErrorState(error.toString()));
      print(error.toString());
    });
  }

  List categories = [];

  void getCategories() async {
    String lang = await CacheHelper.getData(key: 'lang') ?? 'en';
    emit(CategoriesLoadingState());
    DioHelper.getData(url: GetCategories, query: {
      'lang': lang,
    }).then((value) {
      categories.clear();
      categories.addAll(value.data['data']);
      emit(CategoriesSuccessState());
    }).catchError((error) {
      emit(CategoriesErrorState(error.toString()));
      print(error.toString());
    });
  }

  GetProductsModel getProductsModel = GetProductsModel();

  void getProducts({
    String? id,
    String? brandId,
    // required String lang,
  }) async {
    String lang = await CacheHelper.getData(key: 'lang') ?? 'en';
    emit(ProductsLoadingState());
    DioHelper.getData(url: GetProducts, query: {
      'categoryId': '$id',
      'shopId': '$brandId',
      'lang': lang,
    }).then((value) {
      print(value.data);
      getProductsModel = GetProductsModel.fromJson(value.data);
      emit(ProductsSuccessState());
    }).catchError((error) {
      emit(ProductsErrorState(error.toString()));
      print(error.toString());
    });
  }

  // void getAllProducts() async{
  //   String lang = await CacheHelper.getData(key: 'lang')?? 'en';
  //   emit(AllProductsLoadingState());
  //   DioHelper.getData(
  //       url: GetProducts,
  //       query: {
  //         // 'categoryId': '$id',
  //         'lang': lang,
  //       }
  //
  //   ).then((value){
  //     print('-----------------------------------------------------------------------------------'+lang.toString());
  //     getProductsModel = GetProductsModel.fromJson(value.data);
  //     emit(AllProductsSuccessState());
  //   }).catchError((error) {
  //     emit(AllProductsErrorState(error.toString()));
  //     print(error.toString());
  //   });
  // }

  ContactModel contactModel = ContactModel();

  void contactInfo() {
    emit(ContactInfoLoadingState());
    DioHelper.getData(
      url: ContactInfo,
    ).then((value) {
      contactModel = ContactModel.fromJson(value.data);
      emit(ContactInfoSuccessState());
    }).catchError((error) {
      emit(ContactInfoErrorState(error.toString()));
      print(error.toString());
    });
  }

  List brandData = [];

  void getBanners() {
    emit(GetBrandLoadingState());
    DioHelper.getData(
      url: GetBanners,
    ).then((value) {
      brandData.clear();
      brandData.addAll(value.data['data']);
      // print(value.data);
      emit(GetBrandSuccessState());
    }).catchError((error) {
      emit(GetBrandErrorState(error.toString()));
      print(error.toString());
    });
  }

  void addToCart({
    required String id,
    required int quantity,
  }) async {
    emit(AddToCartLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    DioHelper.postData(
      url: AddToCart,
      data: {
        "productId": id,
        "quantity": quantity,
      },
      token: token,
    ).then((value) {
      emit(AddToCartSuccessState());
      print('AddToCart--------------------------------------------' +
          value.data['msg']);
      // Fluttertoast.showToast(
      //     msg: value.data['msg'].toString(),
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: HexColor("#B59945"),
      //     textColor: HexColor('#727C8E'),
      //     fontSize: 16.0);
      getCard();
    }).catchError((error) {
      emit(AddToCartErrorState(error.toString()));
      print(error.toString());
    });
  }

  void rwmoveFromCart({
    required String id,
  }) async {
    emit(RemoveFromCartLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    DioHelper.postData(
      url:
          'http://beautiheath.com/sub/eshop/api/buyers/product/remove-from-cart',
      data: {
        "productId": id,
      },
      token: token,
    ).then((value) {
      emit(RemoveFromCartSuccessState());
      print('RemoveFromCart--------------------------------------------' +
          value.data['msg']);
      Fluttertoast.showToast(
          msg: value.data['msg'].toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: HexColor("#B59945"),
          textColor: HexColor('#727C8E'),
          fontSize: 16.0);
    }).catchError((error) {
      emit(RemoveFromCartErrorState(error.toString()));
      print(error.toString());
    });
  }

  List cart = [];

  void getCard() async {
    emit(GetCartLoadingState());
    String token = await CacheHelper.getData(key: 'token') ?? '';
    DioHelper.getData(
      url: GetCarts,
      token: token,
    ).then((value) {
      cart.clear();
      cart.addAll(value.data!['data']);
      emit(GetCartSuccessState());
    }).catchError((error) {
      emit(GetCartErrorState(error.toString()));
      print(error.toString());
    });
    // String token = await CacheHelper.getData(key: 'token');
    // try{
    //   var response = await http.get(Uri.parse('https://findfamily.net/eshop/api/buyers/product/carts'),
    //       headers: {
    //     'Authorization': 'Bearer $token',
    //   },);
    //   cartModel = CartModel.fromJson(json.decode(response.body));
    //   print('cartModel------------------------------------------'+response.body);
    //   emit(GetCartSuccessState());
    // }
    // catch(error){
    //   emit(GetCartErrorState(error.toString()));
    //   print(error.toString());
    // }
  }

  dynamic contact;

  void contactUs({
    required String name,
    required String subject,
    required String phone,
    required String email,
    required String message,
  }) async {
    emit(ContactUsLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    DioHelper.postContactUsData(url: ContactUs, token: token, data: {
      'name': name,
      'subject': subject,
      'phone': phone,
      'email': email,
      'message': message,
    }).then((value) {
      contact = value.data['msg'];
      emit(ContactUsSuccessState());
    }).catchError((error) {
      emit(ContactUsErrorState(error.toString()));
      print(error.toString());
    });
  }

  String msg = '';
  Map<String, bool> isFavourite = {};

  void addToWishList({
    required String id,
  }) async {
    emit(WishListLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    DioHelper.postWishListData(url: wishlists, token: token, query: {
      'productId': id,
    }).then((value) {
      if (value.data['msg'] == 'added') {
        isFavourite[id] = true;
        Fluttertoast.showToast(
          msg: "تم اضافة المنتج الي المضلة",
          textColor: Colors.white,
          backgroundColor: Colors.green,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        emit(WishListSuccessState());
      } else {
        Fluttertoast.showToast(
          msg: "تم حذف المنتج من المضلة",
          textColor: Colors.white,
          backgroundColor: Colors.red,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
        isFavourite[id] = false;
        emit(WishListSuccessState());
      }
      msg = value.data['msg'];

      print('-----------------------------------------------${msg.toString()}');
    }).catchError((error) {
      emit(WishListErrorState(error.toString()));
      print('error------------------------------------------------------' +
          error.toString());
    });
  }

  WishListModel wishListModel = WishListModel();

  List wish = [];

  void getWishList() async {
    emit(GetWishListLoadingState());
    String token = await CacheHelper.getData(key: 'token') ?? '';
    String lang = await CacheHelper.getData(key: 'lang') ?? 'en';

    try {
      var response = await http.get(
        Uri.parse(
            'http://beautiheath.com/sub/eshop/api/buyers/product/wishlists?lang=$lang'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      wish.clear();
      wishListModel = WishListModel.fromJson(json.decode(response.body));
      var data = json.decode(response.body);
      wish.addAll(data['data']);
      for (var item in data['data']) {
        isFavourite['${item['id']}'] = true;
        emit(GetWishListSuccessState());
      }
      emit(GetWishListSuccessState());
    } catch (error) {
      emit(GetWishListErrorState(error.toString()));
      print(error.toString());
    }
  }

  OffersModel allOffersModel = OffersModel();
  void getAllOffers() {
    emit(AllOffersLoadingState());
    DioHelper.getData(
      url: AllOffers,
    ).then((value) {
      allOffersModel = OffersModel.fromJson(value.data!);
      emit(AllOffersSuccessState());
    }).catchError((error) {
      emit(AllOffersErrorState(error.toString()));
      print('errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr' + error.toString());
    });
  }

  String addReviewMsg = '';

  void addReview({
    required String productId,
    required String comment,
    required double rate,
    required String date,
  }) async {
    emit(AddReviewLoadingState());
    String token = await CacheHelper.getData(key: 'token');
    String lang = await CacheHelper.getData(key: 'lang') ?? 'en';
    DioHelper.postData(
      url: AddReview,
      data: {
        'productId': productId,
        'comment': comment,
        'rate': rate,
        'date': date,
        'lang': lang,
      },
      token: token,
    ).then((value) {
      addReviewMsg = value.data['msg'];
      Fluttertoast.showToast(
          msg: addReviewMsg.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: HexColor('#727C8E'),
          fontSize: 16.0);
      getReviews(id: productId);
      print(value.data);
      emit(AddReviewSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddReviewErrorState(error.toString()));
    });
  }

  ClassReviewsModel classReviewsModel = ClassReviewsModel();

  void getReviews({
    required String id,
  }) async {
    emit(AllReviewLoadingState());
    String token = await CacheHelper.getData(key: 'token') ?? '';
    DioHelper.getData(
      url: AllReviews,
      query: {'productId': id},
      token: token,
    ).then((value) {
      classReviewsModel = ClassReviewsModel.fromJson(value.data);
      print(value.data);
      print('------------------------------------------' + id);
      emit(AllReviewSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AllReviewErrorState(error.toString()));
    });
  }

  bool isKron = false;
  void changeToKron() async {
    isKron = true;
    isDollar = false;
    // isLang3 = false;
    emit(ChangeToKron());
  }

  bool isDollar = false;
  void changeToDollar() async {
    isKron = false;
    isDollar = true;
    emit(ChangeToDollar());
  }

  bool isLang = false;
  void changeAppLang() async {
    isLang = true;
    isLang2 = false;
    isLang3 = false;
    emit(ChangeAppLang());
  }

  bool isLang2 = false;
  void changeAppLang2() {
    isLang2 = true;
    isLang = false;
    isLang3 = false;

    emit(ChangeAppLang());
  }

  bool isLang3 = false;
  void changeAppLang3() {
    isLang3 = true;
    isLang2 = false;
    isLang = false;
    emit(ChangeAppLang());
  }
}
