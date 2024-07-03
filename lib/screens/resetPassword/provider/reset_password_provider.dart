import 'package:flutter/material.dart';
import 'package:my_stackz/screens/login/provider/login_provider.dart';
import 'package:provider/provider.dart';

class ResetPasswordProvider with ChangeNotifier{
  

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);
  ValueNotifier<bool> obscureConfirmPasswordText = ValueNotifier<bool>(true);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  // ValueNotifier<int> scrollIndex = ValueNotifier<int>(0);
  // ValueNotifier<List<AllCategories>> categoryList = ValueNotifier([]);
  //   ValueNotifier<String> address = ValueNotifier("");
  // RxBool obscureText = true.obs;
  // RxBool obscureConfirmPasswordText = true.obs;
  // RxBool isLoading = false.obs;

  onChangePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  onChangeConfirmPasswordVisibility() {
    obscureConfirmPasswordText.value = !obscureConfirmPasswordText.value;
  }

  validateFields(BuildContext context) {
                 LoginProvider loginController = Provider.of<LoginProvider>(context, listen: false);

    if (loginController.formKey.currentState!.validate()) {
      return;
    } else {
      // callResetPasswordApi();
    }
  }

  // callResetPasswordApi() async {
  //   final body = {"password": passwordController.text};
  //   try {
  //     isLoading.value = true;
  //     ResetPasswordResponse response =
  //         await ApiHandler().callPostResetPasswordApi(body);
  //     isLoading.value = false;
  //     if (response.success! && response.message != null) {
  //       Snack.show(
  //           content: response.message ?? '',
  //           snackType: SnackType.info,
  //           behavior: SnackBarBehavior.floating);
  //       Get.toNamed(Routes.DASHBOARD);
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
