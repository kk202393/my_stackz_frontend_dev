import 'dart:convert';
import 'package:dio/dio.dart';

class DioClient {
  static BaseOptions options =
      BaseOptions(connectTimeout: const Duration(seconds: 60));

  final Dio _dio = Dio(options);

  // Set your proxy here

  Future<dynamic> postFormData({
    dynamic data,
    required String url,
    dynamic header,
  }) async {
    final data1 = data;
    var formData = FormData.fromMap(data1);

    try {
      var response = await _dio.post(
        url,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
        data: formData,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postData(
      {dynamic data,
      required String url,
      dynamic header,
      CancelToken? token}) async {
    token = token;
    try {
      var response = await _dio.post(
        url,
        options: Options(
          headers: header,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
        data: data,
        cancelToken: token,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getData({
    required String url,
    dynamic header,
    CancelToken? token,
  }) async {
    token = token;
    try {
      var response = await _dio.get(
        url,
        options: Options(headers: header),
        cancelToken: token,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
