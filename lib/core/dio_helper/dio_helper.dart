import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://respiratory-detection-production.up.railway.app/",
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
