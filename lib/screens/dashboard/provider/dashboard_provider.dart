import 'package:flutter/material.dart';
import 'package:my_stackz/screens/home/views/home_view.dart';

class DashboardProvider with ChangeNotifier {
  final List<Widget> children = [
    const HomeView(),
    // const BookingView(),
    // const FavouritesView(),
    const HomeView(),
    const HomeView(),
  ];
    ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners(); // Notify listeners of changes
  }

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
  }

  // @override
  // void onInit() {
  //   // Get.put(HomeController());
  //   // super.onInit();
  // }

  // @override
  // void onClose() {}

  // void onItemTapped(int index) {
  //   selectedIndex.value = index;
  //   // if (selectedIndex.value == 0) {
  //   //   Get.lazyPut(() => HomeController());
  //   // } else if (selectedIndex.value == 1) {
  //   //   Get.delete<HomeController>();
  //   //   Get.lazyPut(() => BookingController());
  //   // } else if (selectedIndex.value == 2) {
  //   //   Get.delete<HomeController>();
  //   //   Get.lazyPut(() => FavouritesController());
  //   // } else if (selectedIndex.value == 3) {
  //   //   Get.delete<HomeController>();
  //   //   Get.lazyPut(() => NotificationsController());
  //   // } 
  //   /*else if (selectedIndex.value == 4) {
  //     Get.delete<HomeController>();
  //     Get.lazyPut(() => HomeController());
  //   }*/
  // }

  // onBackPressed() {
  //   if (selectedIndex.value != 0) {
  //     onItemTapped(0);
  //     return Future.value(false);
  //   } else {
  //     return Future.value(true);
  //   }
  // }
}
