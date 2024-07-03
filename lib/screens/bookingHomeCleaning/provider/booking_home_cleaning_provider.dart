import 'package:flutter/material.dart';

class BookingHomeCleaningProvider with ChangeNotifier{
      ValueNotifier<int> count = ValueNotifier<int>(0);
        void increment() => count.value++;


}