// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/api/fcm_service.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/dialoge.dart';
import 'package:my_stackz/widgets/snack_bar.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
  final ValueNotifier<bool> rememberMe = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final FcmService _fcmService = FcmService();

  List<dynamic> _addressList = [];
  String _defaultAddress = '';
  LoginResponse? _response;

  List<dynamic> get addressList => _addressList;

  LoginResponse? get logInAPIResponse => _response;

  String get defaultAddress => _defaultAddress;

  void setAddressList(List<dynamic> addresses) {
    _addressList = addresses;
    notifyListeners();
  }

  void setDefaultAddress(String address) {
    _defaultAddress = address;
    notifyListeners();
  }

  void onChangePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void onClickRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<bool> validateFields(GlobalKey<FormState> formKey, homeController,
      BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return false;
    } else {
      bool _isSuccess = await callLoginApi(homeController, context);
      return _isSuccess;
    }
  }

  Future<bool> getMyProfile(BuildContext context) async {
    String? token = await Utils().ReadToken();
    try {
      if (token == null) {
        return false;
      }
      _response = await ApiHandler().callViewProfileApi(token, context);
      return _response!.success;
    } catch (e) {
      return false;
    }
  }

  Future<bool> callLoginApi(homeController, BuildContext context) async {
    isLoading.value = true;
    final body = {
      "email": emailController.text,
      "password": passwordController.text
    };
    try {
      _response = await ApiHandler().callLoginApi(body, context);
      await Utils().storeToken(_response!.token);
      //Call FCM methods after successful login
      final userId = _response!.user!.id;
      final userRole = _response!.userRole;
      await _fcmService.getTokenAndStoreInFirestore(userId, userRole);
      _fcmService.listenForTokenRefresh(userId, userRole);
      isLoading.value = false;
      notifyListeners();
      return true;
    } catch (e) {
      String errorMessage = "Please check your username or password";
      if (e is SocketException) {
        errorMessage = "Network error, please check your internet connection.";
      } else if (e is HttpException) {
        errorMessage = "Server error, please try again later.";
      } else if (e is FormatException) {
        errorMessage = "Data format error, please contact support.";
      }

      // DialogHelper().showSnackBar(
      //   context: context,
      //   msg: _response?.message ?? errorMessage,
      //   backgroundColor: Colors.red.shade600,
      // );

      isLoading.value = false;
      notifyListeners();

      Snack.show(
        content: _response?.message ?? 'Something went wrong',
        snackType: SnackType.error,
        behavior: SnackBarBehavior.floating,
      );
      return false;
    }
  }
}
