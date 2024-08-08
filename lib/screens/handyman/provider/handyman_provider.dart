import 'package:flutter/material.dart';
import 'package:my_stackz/models/home_page_response.dart';

class HandymanProvider with ChangeNotifier{


 ValueNotifier<List<Subcategory>> subcategories = ValueNotifier([]);
    ValueNotifier<List<ServiceCategory>> serviceCategory = ValueNotifier([]);
    ValueNotifier<int> numberOfRooms = ValueNotifier<int>(1);
 ValueNotifier<int> categoryId = ValueNotifier<int>(3);

  // RxList<Subcategories> subcategories = <Subcategories>[].obs;
  // RxList<ServiceCategory> serviceCategory = <ServiceCategory>[].obs;
  // RxInt numberOfRooms = 1.obs;



    void getFilteredSubcategories(List<Subcategory> subcategories) {
    subcategories = subcategories;
    notifyListeners();
  }
void getFilteredSubcategoriesPrice(List<Subcategory> subcategories) {
    subcategories = subcategories;
    notifyListeners();
  }

    // final TextEditingController stationController = TextEditingController();
  ValueNotifier<bool> isBoxClicked = ValueNotifier<bool>(false);
  // RxBool isBoxClicked = false.obs;
 

  // RxList<Subcategories> subcategories = <Subcategories>[].obs;
  // RxList<ServiceCategory> serviceCategory = <ServiceCategory>[].obs;
  // RxInt numberOfRooms = 1.obs;




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

  onBoxClicked() {
    isBoxClicked.value = !isBoxClicked.value;
  }




}