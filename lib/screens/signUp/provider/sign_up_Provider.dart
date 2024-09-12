import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/sign_up_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

import '../../../models/user_device_information_response.dart';
import '../../../utils/utils.dart';

class SignUpProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  ValueNotifier<String> name = ValueNotifier("");
  ValueNotifier<String> userRole = ValueNotifier("");
  ValueNotifier<String> firstName = ValueNotifier("");
  ValueNotifier<String> lastName = ValueNotifier("");
  ValueNotifier<String> email = ValueNotifier("");
  ValueNotifier<String> password = ValueNotifier("");
  ValueNotifier<String> address = ValueNotifier("");
  ValueNotifier<String> phoneNumber = ValueNotifier("");
  ValueNotifier<String> dob = ValueNotifier("");
  ValueNotifier<bool> obscureText = ValueNotifier(true);
  ValueNotifier<bool> rememberMe = ValueNotifier(false);
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String> sId = ValueNotifier("");
  ValueNotifier<String> userMobileIMEINo = ValueNotifier("");
  ValueNotifier<String> userAndroidID = ValueNotifier("");
  ValueNotifier<String> userSocketID = ValueNotifier("");
  ValueNotifier<String> firebaseDeviceToken = ValueNotifier("");

  // @override
  // void onInit() {
  // name.value = Get.arguments["username"];
  // userRole.value = Get.arguments["user_role"];
  // firstName.value = Get.arguments["first_name"];
  // lastName.value = Get.arguments["last_name"];
  // email.value = Get.arguments["email"];
  // password.value = Get.arguments["password"];
  // phoneNumber.value = Get.arguments["phone_number"];
  // address.value = Get.arguments["address"];
  // dob.value = Get.arguments["dob"];
  // callCreateAccountApi();
  //   super.onInit();
  // }
  UserDeviceInformation? _userDeviceInformation;
  UserDeviceInformation? get userDeviceInformationResponse => _userDeviceInformation;


  onChangePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  validateFields(BuildContext context) {

    if (!formKey.currentState!.validate()) {
      return;
    } else {
      callCreateAccountApi();
      /*Navigator.pushNamed(context, Routes.DASHBOARD);*/
    }
  }

  callCreateAccountApi() async {
    isLoading.value = true;
    final body = {
      "username": name.value,
      "user_role": userRole.value,
      "first_name": firstName.value,
      "last_name": lastName.value,
      "email": email.value,
      "password": password.value,
      "phone_number": "+91${phoneNumber.value}",
      "address": address.value,
      "dob": dob.value
    };
    try {
      CreateAccountResponse response =
          await ApiHandler().callCreateAccountApi(body);
      isLoading.value = false;
      if (response.success! && response.user != null) {
        sId.value = response.user!.sId!;
        callUserDeviceInformation();
        Snack.show(
            content: "User Already Exists",
            snackType: SnackType.info,
            behavior: SnackBarBehavior.floating);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

   callUserDeviceInformation() async {
    isLoading.value = true;
    final body = {
      "user_id": sId.value,
      "user_mobile_IMEI_No": userMobileIMEINo.value,
      "user_android_ID": userAndroidID.value,
      "user_socketID": userSocketID.value,
      "firebase_device_token": await Utils().readFCMToken()
    };
    try {
      UserDeviceInformation response =
          await ApiHandler().callUserDeviceInformation(body);
      isLoading.value = false;
      if (response.success! && response.deviceInformation != null) {
        Snack.show(
            content: "Notification Sent",
            snackType: SnackType.info,
            behavior: SnackBarBehavior.floating);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }


}
