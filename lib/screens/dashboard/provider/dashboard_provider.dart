import 'package:flutter/material.dart';
import 'package:my_stackz/screens/booking/views/booking_view.dart';
import 'package:my_stackz/screens/favourites/views/favourites_view.dart';
import 'package:my_stackz/screens/home/views/home_view.dart';
import 'package:my_stackz/screens/notifications/views/notification_view.dart';

class DashboardProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  // List of widgets to display in the body
  final List<Widget> children = [
    const HomeView(),
    const BookingView(),
    FavouriteView(),
    NotificationsView()
  ];

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
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

