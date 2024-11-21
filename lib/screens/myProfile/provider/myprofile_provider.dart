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
   final ValueNotifier<bool> isfirstArrowClicked = ValueNotifier<bool>(false);
    final ValueNotifier <bool> issecondArrowClicked = ValueNotifier<bool>(false);
     final ValueNotifier <bool> isthirdArrowClicked = ValueNotifier<bool>(false);

  final ValueNotifier <bool> isfourArrowClicked = ValueNotifier<bool>(false);

  final ValueNotifier <bool> isfiveArrowClicked = ValueNotifier<bool>(false);

  final ValueNotifier <bool> issixArrowClicked = ValueNotifier<bool>(false);
//  final ValueNotifier <bool> toggleArrowState = ValueNotifier<bool>(false);
//  final ValueNotifier <bool> toggleArrowState = ValueNotifier<bool>(false);


  /// Toggles the arrow click state
  void onfirstArrowClicked() {
    isfirstArrowClicked.value = !isfirstArrowClicked.value;
  }
   void onsecondArrowClicked() {
    issecondArrowClicked.value = !issecondArrowClicked.value;
   }

    void onthirdArrowClicked() {
    isthirdArrowClicked.value = !isthirdArrowClicked.value;
   }
    void onfourArrowClicked() {
    isfourArrowClicked.value = !isfourArrowClicked.value;
   }
    void onfiveArrowState() {
    isfiveArrowClicked.value = !isfiveArrowClicked.value;
   }
    void onsixArrowState() {
    issixArrowClicked.value = !issixArrowClicked.value;
   }
  //   void ontoggleArrowState() {
  //   toggleArrowState.value = !toggleArrowState.value;
  //  }


}
