import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/models/forget_password_response.dart';
import 'package:my_stackz/utils/utils.dart';
import '../constants/app_constants.dart';
import '../models/change_password_response.dart';
import '../models/home_page_response.dart';
import '../models/login_response.dart';
import '../models/logout_response.dart';
import '../models/my_profile_response.dart';
import '../models/reset_password_response.dart';
import '../models/sign_up_response.dart';
import '../utils/shared_preferences.dart';
import '../widgets/snack_bar.dart';
import 'urls.dart';

class ApiHandler {
  static ApiHandler handler = ApiHandler();
  Dio? dio;
  final Dio _dio = Dio();

  ApiHandler() {
    initDio();
  }

  void initDio() {
    dio = Dio();
    dio!.options
      ..connectTimeout = const Duration(milliseconds: 60000)
      ..receiveTimeout = const Duration(milliseconds: 60000);
    dio?.interceptors.add(
        LogInterceptor(responseBody: true, error: true, requestBody: true));
  }

  Future<dynamic> getApi(BuildContext context, url, {queryParams}) async {
    try {
      initDio();
      final Response response =
          await dio!.get(url, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  callLoginApi(body) async {
    try {
      if (dio == null) initDio();
      Response response = await dio!.post(AppURLs.loginURL, data: body);
      debugPrint("Login API ${response.data}");

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint("Login API exception $e");
      _handleError(e);
    }
  }

  callGetViewHomePageApi(String token) async {
    final accessToken = 'Bearer $token';
    try {
      if (dio == null) initDio();
      final Response response = await dio!.get(AppURLs.homePageURL,
          options:
              Options(headers: <String, String>{'Authorization': accessToken}));
      debugPrint("Dashboard API $response");
      HomePageResponse homePageResponse =
          await HomePageResponse.fromJson(response.data);
      if (homePageResponse.allCategories != null &&
          homePageResponse.allCategories.isNotEmpty) {
        AllCategory firstCategory = homePageResponse.allCategories.first;
        debugPrint("First Category ID: ${firstCategory.id}");
      } else {
        debugPrint("No categories found in the response.");
      }
      return HomePageResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  callConsumerBookingApi(body) async {
    String? token = await Utils().ReadToken();

    try {
      if (dio == null) initDio();
      Response response = await dio!.post(
        AppURLs.consumerorderbookingURL,
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      debugPrint("consumerorderbooking API ${response.data}");

      return BookingResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint("consumerorderbooking API exception $e");
      if (e.response != null) {
        debugPrint("Response Data: ${e.response!.data}");
        debugPrint("Response Headers: ${e.response!.headers}");
      }
      _handleError(e);
    }
  }

  callCreateAccountApi(body) async {
    try {
      if (dio == null) initDio();
      final Response response = await dio!.post(AppURLs.createURL, data: body);
      return CreateAccountResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  callViewProfileApi(String token) async {
    final accessToken = 'Bearer $token';
    try {
      if (dio == null) initDio();
      final Response response = await dio!.get(AppURLs.profileURL,
          options:
              Options(headers: <String, String>{'Authorization': accessToken}));
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  callPutChangePasswordApi(body) async {
    try {
      if (dio == null) initDio();
      final Response response =
          await dio!.put(AppURLs.changePasswordURL, data: body);
      return ChangePasswordResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  callLogoutApi(body) async {
    final accessToken = 'Bearer $body';
    try {
      if (dio == null) initDio();
      final Response response = await dio!.post(AppURLs.logoutURL,
          options: Options(headers: <String, String>{
            'Authorization': accessToken.toString()
          }));
      return LogoutResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  callPostForgotPasswordApi(body) async {
    try {
      if (dio == null) initDio();
      final Response response =
          await dio!.post(AppURLs.forgetPasswordURL, data: body);
      return ForgetPasswordResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  callPostResetPasswordApi(body) async {
    final accessToken =
        'Bearer ${await AppPreferences().getSharedPreferences(AppConstants.token)}';
    try {
      if (dio == null) initDio();
      final Response response = await dio!.post(AppURLs.resetPasswordURL,
          data: body,
          options:
              Options(headers: <String, String>{'Authorization': accessToken}));
      return ResetPasswordResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  _handleError(DioException e) {
    Snack.show(
        content: e.response!.data!,
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating);
  }
}
