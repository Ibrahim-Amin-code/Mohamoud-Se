import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static inti() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://beautiheath.com/sub/eshop/api/buyers/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return dio.get(url,
        queryParameters: query ?? null,
        options: Options(
            followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,
            headers: {
              'Authorization': (token != null) ? "Bearer" + token : "",
              //Bearer
            }));
  }

  static Future<Response> getDataNoToken({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return dio.get(
      url,
      queryParameters: query ?? null,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return dio.post(url,
        queryParameters: query ?? null,
        data: data,
        options: Options(headers: {
          'Authorization': (token != null) ? "Bearer" + token : "",
        }));
  }

  static Future<Response> postOrderData({
    required String url,
    Map<String, dynamic>? query,
    required FormData data,
    String? token,
  }) async {
    return dio.post(url,
        queryParameters: query ?? null,
        data: data,
        options: Options(
            followRedirects: false,
            // will not throw errors
            validateStatus: (status) => true,
            headers: {
              'Authorization': "Bearer" + token!,
            }));
  }

  static Future<Response> postWishListData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return dio.post(url,
        queryParameters: query ?? null,
        options: Options(headers: {
          'Authorization': "Bearer" + token!,
        }));
  }

  static Future<Response> postContactUsData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, String> data,
    String? token,
  }) async {
    return dio.post(url,
        queryParameters: query ?? null,
        data: data,
        options: Options(headers: {
          'Authorization': "Bearer" + token!,
        }));
  }

  static Future<Response> postDataForgetPassword({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return dio.post(url,
        queryParameters: query ?? null,
        data: data,
        options: Options(headers: {
          'Authorization': "Bearer" + token!,
        }));
  }

  static Future<Response> updateProfileData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return dio.post(url,
        queryParameters: query ?? null,
        data: data,
        options: Options(headers: {
          'Authorization': "Bearer" + token!,
        }));
  }
}
