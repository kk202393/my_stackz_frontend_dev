import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/dialoge.dart';
import 'package:my_stackz/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class LoginProvider with ChangeNotifier {
  //final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
  ValueNotifier<bool> rememberMe = ValueNotifier<bool>(true);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  List<dynamic> _addressList = [];
  String _defaultAddress = '';
  LoginResponse? _response;

  List<dynamic> get addressList => _addressList;

  LoginResponse get logInAPIResponse => _response!;

  String get defaultAddress => _defaultAddress;

  void setAddressList(List<dynamic> addresses) {
    _addressList = addresses;
    notifyListeners();
  }

  void setDefaultAddress(String address) {
    _defaultAddress = address;
    notifyListeners();
  }

  //  var addressList = <dynamic>[].obs;
  // var defaultAddress = ''.obs;

  // void parseLoginResponse(String responseBody) {
  //   final responseJson = jsonDecode(responseBody);
  //   final loginResponse = LoginResponse.fromJson(responseJson);
  //   if (loginResponse.userAddress.isNotEmpty) {
  //     addressList.value = loginResponse.userAddress[0].addresses;
  //   }
  //   defaultAddress.value = addressList.isNotEmpty
  //       ? addressList[0].address
  //       : 'No address found';

  //   // Print the default address
  //   print("Default address: ${defaultAddress.value}");
  // }

  onChangePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  onClickRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  Future<bool> validateFields(
      formKey, homeController, BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return false;
    } else {
      bool _isSuccess = await callLoginApi(homeController, context);
      if (_isSuccess) {
        return true;
      }
    }
    return false;
  }

  Future<bool> getMyProfile() async {
    String? token = await Utils().ReadToken();
    LoginResponse _response = await ApiHandler().callViewProfileApi(token!);
    if (_response.success) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> callLoginApi(homeController, BuildContext context) async {
    homeController.isLoading.value = true;
    final body = {
      "email": emailController.text,
      "password": passwordController.text
    };

    try {
      LoginResponse _response = await ApiHandler().callLoginApi(body);
      await Utils().storeToken(_response.token);
      homeController.isLoading.value = false;
      notifyListeners();
      return true;
    } catch (e) {
      String errorMessage = "An unexpected error occurred.";
      if (e is SocketException) {
        errorMessage = "Network error, please check your internet connection.";
      } else if (e is HttpException) {
        errorMessage = "Server error, please try again later.";
      } else if (e is FormatException) {
        errorMessage = "Data format error, please contact support.";
      }
      DialogHelper().showSnackBar(
        context: context,
        msg: _response!.massage ?? errorMessage,
        backgroundColor: Colors.red.shade600,
      );

      homeController.isLoading.value = true;
      notifyListeners();

      // Snack.show(
      //   content: _response!.massage ?? errorMessage,
      //   snackType: SnackType.error,
      //   behavior: SnackBarBehavior.floating
      // );
      Snack.show(
          content: _response!.massage ?? 'Something went wrong',
          snackType: SnackType.error,
          behavior: SnackBarBehavior.floating);
      return false;
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:my_stackz/api/api_handler.dart';
// import 'package:my_stackz/models/login_response.dart';
// import 'package:my_stackz/widgets/snack_bar.dart';

// class LoginProvider with ChangeNotifier{
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
//   ValueNotifier<bool> rememberMe = ValueNotifier<bool>(true);
//   ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

//   List<dynamic> _addressList = [];
//   String _defaultAddress = '';
//   LoginResponse? _response;

//   List<dynamic> get addressList => _addressList;
//   LoginResponse get logInAPIResponse => _response!;
//   String get defaultAddress => _defaultAddress;

//   void setAddressList(List<dynamic> addresses) {
//     _addressList = addresses;
//     notifyListeners();
//   }

//   void setDefaultAddress(String address) {
//     _defaultAddress = address;
//     notifyListeners();
//   }

//   //  var addressList = <dynamic>[].obs;
//   // var defaultAddress = ''.obs;

//   // void parseLoginResponse(String responseBody) {
//   //   final responseJson = jsonDecode(responseBody);
//   //   final loginResponse = LoginResponse.fromJson(responseJson);
//   //   if (loginResponse.userAddress.isNotEmpty) {
//   //     addressList.value = loginResponse.userAddress[0].addresses;
//   //   }
//   //   defaultAddress.value = addressList.isNotEmpty
//   //       ? addressList[0].address
//   //       : 'No address found';

//   //   // Print the default address
//   //   print("Default address: ${defaultAddress.value}");
//   // }

//   onChangePasswordVisibility() {
//     obscureText.value = !obscureText.value;
//   }

//   onClickRememberMe() {
//     rememberMe.value = !rememberMe.value;
//   }

//   Future<bool> validateFields() async {
//     if (formKey.currentState!.validate()) {
//       return false;
//     } else {
//       bool _isSuccess = await callLoginApi();
//       if (_isSuccess) {
//         return true;
//       }
//     }
//     return false;
//   }

//   Future<bool> callLoginApi() async {
//     isLoading.value = true;
//     final body = {
//       "email": emailController.text,
//       "password": passwordController.text
//     };
//     try {
//       _response = await ApiHandler().callLoginApi(body);
//       // debugPrint("Login response ${response.userAddress}");
//       // _addressList = _response!.userAddress;
//       isLoading.value = false;
//       return true;
//     } catch (e) {
//       isLoading.value = false;
//       Snack.show(
//           content: _response!.massage ?? 'Something went wrong',
//           snackType: SnackType.error,
//           behavior: SnackBarBehavior.floating);
//       return false;
//     }
//   }
// }
