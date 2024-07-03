import 'package:flutter/material.dart';

class BookingAcceptedProvider with ChangeNotifier{
     //TODO: Implement BookingController
    ValueNotifier<int> count = ValueNotifier<int>(0);

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void increment() => count.value++;
}