import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier{
      ValueNotifier<int> count = ValueNotifier<int>(0);
        void increment() => count.value++;


}