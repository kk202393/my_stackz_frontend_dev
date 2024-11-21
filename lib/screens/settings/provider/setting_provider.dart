// import 'package:flutter/material.dart';
// import 'package:my_stackz/constants/app_constants.dart';
// import 'package:my_stackz/screens/login/provider/login_provider.dart';
// import 'package:my_stackz/utils/shared_preferences.dart';
// import 'package:provider/provider.dart';

// class SettingsProvider with ChangeNotifier{
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController oldPasswordController = TextEditingController();
//   final TextEditingController newPasswordController = TextEditingController();
//   ValueNotifier<String> token = ValueNotifier("");
//     ValueNotifier<bool> isLoading = ValueNotifier(false);
//         ValueNotifier<bool> show = ValueNotifier(false);

//   // RxBool show = false.obs;
//   // RxBool isLoading = false.obs;
//   // RxString token = "".obs;

//   // @override
//   // void onInit() {
//   //   getDetails();
//   //   super.onInit();
//   // }

//   onClickShow() {
//     show.value = !show.value;
//   }

//   getDetails() async {
//     token.value = await AppPreferences().getSharedPreferences(AppConstants.token);
//   }

//   validateFields(BuildContext context) {
//                  //LoginProvider loginController = Provider.of<LoginProvider>(context, listen: false);

//     if (formKey.currentState!.validate()) {
//       return;
//     } else {
//       // callChangePasswordApi();
//     }
//   }

//   // callChangePasswordApi() async {
//   //   final body = {
//   //     "token": token.value,
//   //     "oldPassword": oldPasswordController.text,
//   //     "newPassword": newPasswordController.text,
//   //   };
//   //   try {
//   //     isLoading.value = true;
//   //     ChangePasswordResponse response =
//   //     await ApiHandler().callPutChangePasswordApi(body);
//   //     isLoading.value = false;
//   //     if (response.success! && response.message != null) {
//   //       Snack.show(
//   //           content: response.message ?? '',
//   //           snackType: SnackType.info,
//   //           behavior: SnackBarBehavior.floating);
//   //       Get.toNamed(Routes.THANK_YOU_PAGE);
//   //     } else {
//   //       Snack.show(
//   //           content: response.message ?? '',
//   //           snackType: SnackType.error,
//   //           behavior: SnackBarBehavior.floating);
//   //     }
//   //   } catch (e) {
//   //     isLoading.value = false;
//   //   }
//   // }

// }



import 'package:flutter/material.dart';
import 'package:my_stackz/constants/app_constants.dart';
import 'package:my_stackz/utils/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  ValueNotifier<String> token = ValueNotifier("");
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<bool> show = ValueNotifier(false);

  // Toggles the visibility of the password
  void onClickShow() {
    show.value = !show.value;
    notifyListeners();
  }

  // Fetches token details from shared preferences
  Future<void> getDetails() async {
    token.value =
        await AppPreferences().getSharedPreferences(AppConstants.token);
    notifyListeners();
  }

  // Validates form fields
  void validateFields(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Form is valid, proceed to call API or perform further actions
      // Example: callChangePasswordApi(context);
    } else {
      // Handle form validation failure
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  // Example function for calling the API (implementation depends on your project)
  Future<void> callChangePasswordApi(BuildContext context) async {
    final body = {
      "token": token.value,
      "oldPassword": oldPasswordController.text,
      "newPassword": newPasswordController.text,
    };

    try {
      isLoading.value = true;
      notifyListeners();

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
      notifyListeners();

      // Handle success response
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password changed successfully!'),
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Navigate to another page (if needed)
      Navigator.pushNamed(context, '/thank_you_page');
    } catch (e) {
      isLoading.value = false;
      notifyListeners();

      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to change password. Please try again.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
