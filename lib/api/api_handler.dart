// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/api/dio_client.dart';
import 'package:my_stackz/constants/app_colors.dart';
import 'package:my_stackz/constants/app_images.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/models/forget_password_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/button_widget.dart';
import 'package:my_stackz/widgets/text_widget.dart';

import '../constants/app_constants.dart';
import '../models/change_password_response.dart';
import '../models/home_page_response.dart';
import '../models/login_response.dart';
import '../models/logout_response.dart';
import '../models/reset_password_response.dart';
import '../models/sign_up_response.dart';
import '../utils/shared_preferences.dart';
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

  Future<Map<String, dynamic>?> callCreateNewAddressApi(
      Map<String, dynamic> body) async {
    try {
      if (dio == null) initDio();
      String? token = await Utils().ReadToken();
      Response response = await DioClient().postData(
        url: AppURLs.createNewAddress,
        header: <String, String>{
          'Authorization': 'Bearer $token',
        },
        data: body,
      );
      print("Address API ${response.data}");

      if (response.statusCode == 200 && response.data['success'] == true) {
        return response.data;
      } else {
        return null;
      }
    } on DioException catch (e) {
      debugPrint("Address API exception $e");
      _handleError(e);
      return null;
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

  callConsumerBookingApi(
      Map<String, dynamic> body, BuildContext context) async {
    String? token = await Utils().ReadToken();

    if (token == null || token.isEmpty) {
      debugPrint('Token is missing');
      return null;
    }
    try {
      if (dio == null) initDio();
      Response response = await DioClient().postData(
          url: AppURLs.consumerorderbookingURL,
          header: <String, String>{
            'Authorization': 'Bearer $token',
          },
          data: body);
      return BookingResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e, context: context);
    }
  }

  callCreateAccountApi(body, context) async {
    try {
      if (dio == null) initDio();
      final Response response = await dio!.post(AppURLs.createURL, data: body);
      return CreateAccountResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e, context: context);
    }
  }

  callDeleteUserBookingApi(String token) async {
    final accessToken = 'Bearer $token';
    try {
      if (dio == null) initDio();
      final Response response = await dio!.get(AppURLs.deleteuserBookingURL,
          options:
              Options(headers: <String, String>{'Authorization': accessToken}));
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('DioException: ${e.message}');
      if (e.response != null) {
        debugPrint('Response Data: ${e.response!.data}');
        debugPrint('Response Headers: ${e.response!.headers}');
      }
      _handleError(e);
      return null;
    } catch (e, stacktrace) {
      debugPrint('Unexpected error: $e');
      debugPrint('Stacktrace: $stacktrace');
      return null;
    }
  }

  // Future<BookingResponse?> updateUserBookingStatus(
  //     Map<String, dynamic> body) async {
  //   String? token = await Utils().ReadToken();

  //   if (token == null) {
  //     debugPrint('Token is missing');
  //     return null;
  //   }

  //   try {
  //     if (dio == null) {
  //       initDio();
  //     }

  //     final Response response = await dio!.put(
  //       AppURLs.userBookingUpdated,
  //       data: body,
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $token'},
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       return BookingResponse.fromJson(response.data);
  //     } else {
  //       debugPrint('API call failed with status code: ${response.statusCode}');
  //       return null;
  //     }
  //   } on DioException catch (e) {
  //     debugPrint('Dio error: ${e.message}');
  //     if (e.response != null) {}
  //     _handleError(e);

  //   }
  // }

  // updateUserBookingStatus(body) async {
  //   String? token = await Utils().ReadToken();

  //   try {
  //     if (dio == null) initDio();
  //     final Response response = await dio!.put(
  //       AppURLs.userBookingUpdated,
  //       data: body,
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $token'},
  //       ),
  //     );
  //     return BookingResponse.fromJson(response.data);
  //   } on DioException catch (e) {
  //     _handleError(e);
  //   }
  // }

  Future<BookingResponse?> updateUserBookingStatus(
      Map<String, dynamic> body) async {
    try {
      final String? token = await Utils().ReadToken();
      if (token == null) {
        debugPrint('Token is missing');
        return null;
      }

      debugPrint('Token: $token');
      debugPrint('Request Body: $body');

      final response = await dio!.put(
        AppURLs.userBookingUpdated,
        data: body,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      debugPrint('Status Code: ${response.statusCode}');
      debugPrint('API Response: ${response.data}');

      if (response.statusCode == 200) {
        return BookingResponse.fromJson(response.data);
      } else {
        debugPrint('API call failed with status code: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      debugPrint('DioException: ${e.message}');
      if (e.response != null) {
        debugPrint('Response Data: ${e.response!.data}');
        debugPrint('Response Headers: ${e.response!.headers}');
      }
      _handleError(e);
      return null;
    } catch (e, stacktrace) {
      debugPrint('Unexpected error: $e');
      debugPrint('Stacktrace: $stacktrace');
      return null;
    }
  }

  callViewProfileApi(String token, BuildContext context) async {
    final accessToken = 'Bearer $token';
    try {
      // if (dio == null) initDio();
      final Response response = await DioClient().getData(
        url: AppURLs.profileURL,
        header: <String, String>{'Authorization': accessToken},
      );
     
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      _handleError(e,context: context);
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

//   _handleError(DioException e, {BuildContext? context}) {
//     showDialog(
//         builder: (context) {
//           ApiException apiExp = e.error as ApiException;
//           return AlertDialog(
//             surfaceTintColor: AppColors.white,
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.width * 0.2,
//                   child: TweenAnimationBuilder<double>(
//                     tween: Tween<double>(begin: 20.0, end: 80.0),
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.bounceOut,
//                     builder:
//                         (BuildContext context, double value, Widget? child) {
//                       return Image.asset(
//                         AppImages.alert,
//                         width: value,
//                       );
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextWidget(
//                   text: apiExp.cause.toString(),
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14
//                   ),
//                 ),
//               ],
//             ),
//             actions: [
//               Center(
//                 child: ButtonWidget(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   buttonText: 'ok',
//                 ),
//               ),
//             ],
//           );
//         },
//         context: context!);
//   }
// }  

void _handleError(DioException e, {BuildContext? context}) {
  showDialog(
    context: context!,
    builder: (context) {
      // Check if the error is an instance of ApiException
      final apiExp = e.error is ApiException ? e.error as ApiException : null;
      
      return AlertDialog(
        surfaceTintColor: AppColors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 20.0, end: 80.0),
                duration: const Duration(seconds: 1),
                curve: Curves.bounceOut,
                builder: (BuildContext context, double value, Widget? child) {
                  return Image.asset(
                    AppImages.alert,
                    width: value,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            TextWidget(
              //   text: apiExp.cause.toString(),
              text: apiExp?.cause.toString() ?? 'An unknown error occurred.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: ButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
              buttonText: 'OK',
            ),
          ),
        ],
      );
    },
  );
}
}