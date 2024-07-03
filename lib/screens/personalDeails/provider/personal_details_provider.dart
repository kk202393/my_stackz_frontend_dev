import 'package:flutter/material.dart';

class PersonalDetailsProvider with ChangeNotifier{

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  // ValueNotifier<List<User>> viewProfileResult = ValueNotifier([]);
  ValueNotifier<String> token = ValueNotifier("");
    ValueNotifier<bool> isLoading = ValueNotifier(false);

  // Rx<User> viewProfileResult = User().obs;
  // RxBool isLoading = false.obs;
  // RxString token = ''.obs;

  // @override
  // void onInit() {
  //   // callViewProfileApi();
  //   super.onInit();
  // }

  // callViewProfileApi() async {
  //   token.value =
  //       await AppPreferences().getSharedPreferences(AppConstants.token);
  //   debugPrint("token value ${token.value}");
  //   isLoading.value = true;
  //   final body = {"token": token.value};
  //   try {
  //     MyProfileResponse response = await ApiHandler().callViewProfileApi(body);
  //     isLoading.value = false;
  //     if (response.success! && response.user != null) {
  //       viewProfileResult.value = response.user![0];
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //   }
  // }
}
