import 'package:flutter/material.dart';
import 'package:my_stackz/models/home_page_response.dart';

class AirconProvider with ChangeNotifier{


    // final TextEditingController stationController = TextEditingController();
  ValueNotifier<bool> isBoxClicked = ValueNotifier<bool>(false);
  // RxBool isBoxClicked = false.obs;
   ValueNotifier<List<Subcategories>> subcategories = ValueNotifier([]);
    ValueNotifier<List<ServiceCategory>> serviceCategory = ValueNotifier([]);
     
    ValueNotifier<int> numberOfRooms = ValueNotifier<int>(1);




   void getFilteredSubcategories(List<Subcategories> subcategories) {
    subcategories = subcategories;
    notifyListeners();
  }
void getFilteredSubcategoriesPrice(List<Subcategories> subcategories) {
    subcategories = subcategories;
    notifyListeners();
  }
  

  // @override
  // void onInit() {
  //   // subcategories.addAll(Get.arguments["subcategories"]);
  //   // super.onInit();
  // }

  onClickAddRooms() {
    numberOfRooms.value = numberOfRooms.value + 1;
  }

  onClickRemoveRooms() {
    if (numberOfRooms.value > 1) {
      numberOfRooms.value = numberOfRooms.value - 1;
    }
  }

  onBoxClicked() {
    isBoxClicked.value = !isBoxClicked.value;
  }
}