import 'package:flutter/material.dart';

import '../../../../models/home_page_response.dart';

class AdditionalDetailsProvider with  ChangeNotifier {
    ValueNotifier<bool> isSwitched = ValueNotifier<bool>(false);
    ValueNotifier<bool> isBoxClicked = ValueNotifier<bool>(false);
  ValueNotifier<List<Subcategories>> subcategories = ValueNotifier([]);
    ValueNotifier<List<ServiceCategory>> serviceCategory = ValueNotifier([]);
  // RxBool isSwitched = false.obs;
  // RxBool isBoxClicked = false.obs;
    ValueNotifier<int> numberOfRooms = ValueNotifier<int>(1);

  // RxInt numberOfRooms = 1.obs;
  // RxList<Subcategories> subcategories = <Subcategories>[].obs;
  // RxList<ServiceCategory> serviceCategory = <ServiceCategory>[].obs;
  void getFilteredSubcategories(List<Subcategories> subcategories) {
    subcategories = subcategories;
    notifyListeners();
  }
void getFilteredSubcategoriesPrice(List<Subcategories> subcategories) {
    subcategories = subcategories;
    notifyListeners();
  }
  // List<Subcategories> getFilteredSubcategories() {
  //   return subcategories
  //       .where((subcategory) => subcategory.subcategoryName != null)
  //       .toList();
  // }

  // List<Subcategories> getFilteredSubcategoriesPrice() {
  //   return subcategories
  //       .where((subcategory) => subcategory.price != null)
  //       .toList();
  // }

  @override
  // void onInit() {
    // subcategories.addAll(Get.arguments["subcategories"]);
    // super.onInit();
  // }

  onBoxClicked() {
    isBoxClicked.value = !isBoxClicked.value;
  }

  onClickAddRooms() {
    numberOfRooms.value = numberOfRooms.value + 1;
  }

  onClickRemoveRooms() {
    if (numberOfRooms.value > 1) {
      numberOfRooms.value = numberOfRooms.value - 1;
    }
  }

  toggleSwitch(bool value) {
    isSwitched.value = value;
  }
}
