import 'package:flutter/material.dart';

class CartSummaryProvider  with ChangeNotifier{
   final scrollController = ScrollController();
   ValueNotifier<int> numberOfServices = ValueNotifier<int>(1);

   onClickAddServices() {
      numberOfServices.value = numberOfServices.value + 1;
   }

   onClickRemoveServices() {
      if (numberOfServices.value > 1) {
         numberOfServices.value = numberOfServices.value - 1;
      }
   }
   
  

}