import 'package:flutter/material.dart';
import 'package:my_stackz/models/home_page_response.dart';

class CleaningProvider with ChangeNotifier{
  // final TextEditingController stationController = TextEditingController();
  ValueNotifier<bool> isBoxClicked = ValueNotifier<bool>(false);
  // RxBool isBoxClicked = false.obs;
    ValueNotifier<List<Subcategories>> subcategories = ValueNotifier([]);
    ValueNotifier<List<ServiceCategory>> serviceCategory = ValueNotifier([]);
    ValueNotifier<int> numberOfRooms = ValueNotifier<int>(1);
    ValueNotifier<int> numberOfHours = ValueNotifier<int>(1);

  // RxList<Subcategories> subcategories = <Subcategories>[].obs;
  // RxList<ServiceCategory> serviceCategory = <ServiceCategory>[].obs;
  // RxInt numberOfRooms = 1.obs;



    void getFilteredSubcategories(List<Subcategories> subcategories) {
    subcategories = subcategories;
    notifyListeners();
  }
void getFilteredSubcategoriesPrice(List<Subcategories> subcategories) {
    subcategories = subcategories;
    notifyListeners();
  }
//  List<Subcategories> getFilteredSubcategories() {
//     return subcategories.where((subcategory) => subcategory.subcategoryName != null).toList();
//   }
//    List<Subcategories> getFilteredSubcategoriesPrice() {
//     return subcategories.where((subcategory) => subcategory.price != null).toList();
//   }
  
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

  onClickAddHours() {
    numberOfHours.value = numberOfHours.value + 1;
  }

  onClickRemoveHours() {
    if (numberOfHours.value > 1) {
      numberOfHours.value = numberOfHours.value - 1;
    }
  }

  onBoxClicked() {
    isBoxClicked.value = !isBoxClicked.value;
  }
}