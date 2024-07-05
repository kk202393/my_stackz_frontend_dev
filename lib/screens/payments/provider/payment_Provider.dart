import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier{
  ValueNotifier<bool> payVia = ValueNotifier<bool>(false);
  onClickPayment() {
    payVia.value = !payVia.value;
  }

  ValueNotifier<int> count = ValueNotifier<int>(0);
        void increment() => count.value++;

}