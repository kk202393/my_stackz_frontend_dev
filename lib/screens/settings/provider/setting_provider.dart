import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_constants.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:my_stackz/utils/shared_preferences.dart';
import 'package:provider/provider.dart';

class SettingsProvider with ChangeNotifier{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  ValueNotifier<String> token = ValueNotifier("");
    ValueNotifier<bool> isLoading = ValueNotifier(false);
        ValueNotifier<bool> show = ValueNotifier(false);

  // RxBool show = false.obs;
  // RxBool isLoading = false.obs;
  // RxString token = "".obs;

  // @override
  // void onInit() {
  //   getDetails();
  //   super.onInit();
  // }

  onClickShow() {
    show.value = !show.value;
  }

  getDetails() async {
    token.value = await AppPreferences().getSharedPreferences(AppConstants.token);
  }

  validateFields(BuildContext context) {
                 //LoginProvider loginController = Provider.of<LoginProvider>(context, listen: false);

    if (formKey.currentState!.validate()) {
      return;
    } else {
      // callChangePasswordApi();
    }
  }

  // callChangePasswordApi() async {
  //   final body = {
  //     "token": token.value,
  //     "oldPassword": oldPasswordController.text,
  //     "newPassword": newPasswordController.text,
  //   };
  //   try {
  //     isLoading.value = true;
  //     ChangePasswordResponse response =
  //     await ApiHandler().callPutChangePasswordApi(body);
  //     isLoading.value = false;
  //     if (response.success! && response.message != null) {
  //       Snack.show(
  //           content: response.message ?? '',
  //           snackType: SnackType.info,
  //           behavior: SnackBarBehavior.floating);
  //       Get.toNamed(Routes.THANK_YOU_PAGE);
  //     } else {
  //       Snack.show(
  //           content: response.message ?? '',
  //           snackType: SnackType.error,
  //           behavior: SnackBarBehavior.floating);
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //   }
  // }

}
