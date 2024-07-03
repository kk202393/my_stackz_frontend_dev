import 'package:flutter/material.dart';

class MyProfileProvider with ChangeNotifier{
//  RxBool isLoading = false.obs;
//   Rx<User> viewProfileResult = User().obs;
//   RxString token = ''.obs;


  // @override
  // void onInit() {
  //   // callViewProfileApi();
  //   super.onInit();
  // }

  // callViewProfileApi() async {
  //   token.value = await AppPreferences().getSharedPreferences(AppConstants.token);
  //   isLoading.value = true;
  //   final body = {
  //     "token": token.value,
  //   };
  //   try {
  //     MyProfileResponse response =
  //     await ApiHandler().callViewProfileApi(body);
  //     isLoading.value = false;
  //     if (response.success! && response.user != null) {
  //       viewProfileResult.value = response.user![0];
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //   }
  // }

}
