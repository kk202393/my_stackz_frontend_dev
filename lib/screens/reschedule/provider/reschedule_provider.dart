import 'package:flutter/material.dart';

class RescheduleProvider with ChangeNotifier{
        ValueNotifier<int> count = ValueNotifier<int>(0);
          void increment() => count.value++;


}