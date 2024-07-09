import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      //local http://127.0.0.1:8000/
      baseUrl: "http://192.168.1.3:8000/",
      // receiveDataWhenStatusError: true,
      // connectTimeout: const Duration(
      //   seconds: 10,
      // ),
      // receiveTimeout: const Duration(
      //   seconds: 10,
      // ),
    ));
  }

static Future<Response> getDate({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
    };
    try {
      return await dio.get(
        url,
        queryParameters: query,
      );
    } on DioException catch (e) {
      debugPrint('DioError: $e');
      rethrow;
    }
  }

  static Future<Response> postDate({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return dio.post(
      url,
      queryParameters: query,
      data: FormData.fromMap(data!),
    );
  }

  static Future<Response> putDate({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
/*
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "http://192.168.1.2:8000/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getDate({
    required String url,
    Map<String, dynamic>? query,
    required String token,
  }) async {
    dio.options.headers = {
      'Authorization': token,
    };
    return await dio.get(
      url,
    );
  }

  static Future<Response> postDate({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return dio.post(
      url,
      queryParameters: query,
      data: FormData.fromMap(data!),
    );
  }

 */
