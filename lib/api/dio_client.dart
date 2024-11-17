// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:my_stackz/api/services_locator.dart';
import 'package:my_stackz/utils/utils.dart';

class DioClient implements ApiServices {
  static BaseOptions options = BaseOptions(
    connectTimeout: const Duration(seconds: 40),
    receiveTimeout: const Duration(seconds: 40),
    sendTimeout: const Duration(seconds: 40),
  );

  Dio _dio = Dio(options);
  DioClient() {
    createDio();
  }

  Dio createDio() {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 40),
      receiveTimeout: const Duration(seconds: 40),
      sendTimeout: const Duration(seconds: 40),
    ));

    return addInterceptors(_dio);
  }

  Dio addInterceptors(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler rih) =>
            requestInterceptor(options, rih),
        onResponse: (Response response, ResponseInterceptorHandler rih) =>
            responseInterceptor(response, rih),
        onError: ((DioException e, ErrorInterceptorHandler handler) =>
            errorInterceptor(e, handler))));
    // if (!SET_PROXY) {
    //   dio.interceptors.add(CertificatePinningInterceptor(
    //       allowedSHAFingerprints: [sha256fingerprintSuperApp]));
    // }
    // dio.interceptors.add(RetryableIntercept(this));
    // dio.interceptors.add(SuperOauthInterceptor());
    return dio;
  }

  dynamic requestInterceptor(
      RequestOptions options, RequestInterceptorHandler rih) async {
    options.headers[Headers.contentTypeHeader] = Headers.jsonContentType;
    options.headers[Headers.acceptHeader] = Headers.jsonContentType;
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult[0] == ConnectivityResult.none) {
    //   var e = DioError(
    //       type: DioExceptionType.connectionError,
    //       requestOptions: options,
    //       error: "No Internet");
    //   rih.reject(e, true);
    // } else {
    //   /*if (!await Utils.hasNetwork()) {
    //     var e = DioError(
    //         type: DioExceptionType.connectionError,
    //         requestOptions: options,
    //         error: "No Internet");
    //     rih.reject(e, true);
    //   }*/
    // }
    rih.next(options);
    return;
  }

  dynamic responseInterceptor(
      Response options, ResponseInterceptorHandler rih) async {
    Utils.log("In response interceptor");
    // if (options.data != null) {
    //   Utils.trimAllStrings(options.data);
    // }
    try {
      if (options.data.containsKey("success") &&
          options.data.containsKey("message")) {
        if ((options.data["success"] == false)) {
          rih.reject(
              DioException.badResponse(
                  statusCode: 0,
                  requestOptions: options.requestOptions,
                  response: options),
              true);
        } else {
          rih.next(options);
        }
      } else {
        rih.next(options);
      }
    } catch (e) {
      rih.reject(
          DioException.badResponse(
              statusCode: 0,
              requestOptions: options.requestOptions,
              response: options),
          true);
    }

    return;
  }

  dynamic errorInterceptor(DioException err, ErrorInterceptorHandler eih) {
    Utils.log("In error interceptor");
    if ((err.type == DioExceptionType.cancel) &&
        (err.error.runtimeType == String)) {
      Utils.log("In ApiException interceptor-----Internet Unavilable");
      Utils.log(err);
      throw ApiException(420, err.error as String);
    } else if ((err.type == DioExceptionType.badResponse) &&
        (err.response?.data.runtimeType == String)) {
      Utils.log("In ApiException interceptor");
      Utils.log(err);
      throw ApiException(
          err.response?.statusCode ?? 0, "Something went wrong!!");
    } else if ((err.type == DioExceptionType.badResponse) &&
        ((err.response?.statusCode) == 401)) {
      Utils.log("In ApiException interceptor");
      Utils.log(err);
      throw ApiException(err.response?.statusCode ?? 401,
          (err.response?.data["message"] ?? "Unauthorized"));
    } else if ((err.type == DioExceptionType.badResponse)) {
      // If the DioError was thrown due to a response error, convert it into a custom exception
      Utils.log("In ApiException interceptor");
      Utils.log(err);
      if (err.response?.data.containsKey("success")) {
        if ((err.response?.data["success"] == false)) {
          throw ApiException(400, err.response?.data["message"]);
        }
      }
      throw ApiException(
          err.response?.statusCode ?? 500, "Something went wrong!!");
    } else if (err.type == DioExceptionType.badResponse) {
      Utils.log("Server error");
      Utils.log(err);
      throw ApiException(err.response?.statusCode ?? 500,
          ("Something went wrong. Server Error."));
    } else if (err.type == DioExceptionType.badCertificate) {
      Utils.log("Bad Certificate");
      Utils.log(err);
      throw ApiException(err.response?.statusCode ?? 500,
          ("Something went wrong. Security Error."));
    } else if ((err.type == DioExceptionType.connectionTimeout) ||
        (err.type == DioExceptionType.receiveTimeout) ||
        (err.type == DioExceptionType.sendTimeout)) {
      Utils.log("Timeout occured");
      Utils.log(err);
      throw ApiException(
          408, ("Request timed out! Please check your internet connection."));
    } else {
      Utils.log("Unknown error");
      Utils.log(err);
      throw ApiException(
          err.response?.statusCode ?? 500, ("Something went wrong."));
    }
    //return err;
  }

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
        options: Options(headers: header, responseType: ResponseType.json),
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

class ApiException implements Exception {
  int code;
  String cause;

  ApiException(this.code, this.cause) {
    if (cause.contains("##")) {
      cause = cause.split("##")[0];
    }
  }
}
