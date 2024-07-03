import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/sign_up_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class SignUpProvider with ChangeNotifier {
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

  onChangePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  validateFields(BuildContext context) {
    LoginProvider loginController =
        Provider.of<LoginProvider>(context, listen: false);

    if (loginController.formKey.currentState!.validate()) {
      return;
    } else {
      Navigator.pushNamed(context, Routes.DASHBOARD);
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
        Snack.show(
            content: "User Already Exists",
            snackType: SnackType.info,
            behavior: SnackBarBehavior.floating);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}
