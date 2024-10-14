// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioClient {
  static BaseOptions options =
      BaseOptions(connectTimeout: const Duration(seconds: 60));

  final Dio _dio = Dio(options);

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
        options: Options(headers: header),
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
      _dio.httpClientAdapter = DefaultHttpClientAdapter()
        ..onHttpClientCreate = (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      var response = await _dio.post(
        url,
        options: Options(headers: header,responseType: ResponseType.json),
        data: jsonEncode(data),
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
