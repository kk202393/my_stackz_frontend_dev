import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

class BookingProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ValueNotifier<int> count = ValueNotifier<int>(0);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  ValueNotifier<int> serviceCategoryId = ValueNotifier<int>(0);
  ValueNotifier<int> subCategoryId = ValueNotifier<int>(0);
  ValueNotifier<int> categoryId = ValueNotifier<int>(0);
  ValueNotifier<String> bookingDate = ValueNotifier<String>("");
  ValueNotifier<String> timeSlotId = ValueNotifier<String>("");
  ValueNotifier<String> bookingId = ValueNotifier<String>("");
  ValueNotifier<String> useraddressId = ValueNotifier<String>("");
  ValueNotifier<int?> selectedAddressIndex = ValueNotifier<int?>(0);
  BookingResponse? _response;

  BookingResponse? get bookingAPIResponse => _response;

  Future<bool> callBookingPageApi(
      BuildContext context,
      int serviceCategory,
      int subCategory,
      int category,
      String? selectedDateString,
      String? selectedTimeSlotId,
      String? selectedAddressId,
      int? selectedAddressIndexValue) async {
    isLoading.value = true;

    serviceCategoryId.value = serviceCategory;
    subCategoryId.value = subCategory;
    categoryId.value = category;
    bookingDate.value = selectedDateString ?? "";
    timeSlotId.value = selectedTimeSlotId ?? "";
    useraddressId.value = selectedAddressId ?? "";
    selectedAddressIndex.value = selectedAddressIndexValue ?? 1;

    Map<String, dynamic> body = {
      "servicecategory_id": serviceCategoryId.value,
      "subcategory_id": subCategoryId.value,
      "category_id": categoryId.value,
      "booking_date": bookingDate.value,
      "time_slot_id": timeSlotId.value,
      "useraddress_id": useraddressId.value,
    };

    try {
      BookingResponse? _response =
          await ApiHandler().callConsumerBookingApi(body);

      isLoading.value = false;
      notifyListeners();

      print("response=$_response");

      if (_response != null && _response.success) {
        return true;
      } else {
        print("Booking failed. Response: $_response");
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      notifyListeners();
      // Log the error
      print("Error: $e");
      return false;
    }
  }

  Future<bool> getDeleteUser() async {
    String? token = await Utils().ReadToken();
    if (token == null) {
      print("Token is missing.");
      return false;
    }

    final String bookingId = this.bookingId.value;
    print("Booking ID before API call: $bookingId");

    if (bookingId.isEmpty) {
      print("Booking ID is missing.");
      return false;
    }

    _response = await ApiHandler().callDeleteUserBookingApi(token, bookingId);
    if (_response != null) {
      print("Response: ${_response!.success} - ${_response!.massage}");
    }

    return _response?.success ?? false;
  }

  // Future<void> getConsumerBookingStatus(BuildContext context) async {
  //   try {
  //     isLoading.value = true;

  //     final token = await Utils().ReadToken();

  //     if (token == null) {
  //       Snack.show(
  //           content: "Token is missing.",
  //           snackType: SnackType.error,
  //           behavior: SnackBarBehavior.floating);
  //       isLoading.value = false;
  //       return;
  //     }
  //     final bookingStatus = _response!
  //         .consumerOrderDetails.consumerBookingStatus.bookingStatus
  //         .toString();
  //     final bookingStatusId =
  //         _response!.consumerOrderDetails.consumerUserId.toString();
  //     // final bookingStatusId = '3'; // Replace with the actual getter if needed
  //     // final bookingStatus = 'Accepted'; // Replace with the actual getter if needed

  //     if (bookingStatusId.isEmpty || bookingStatus.isEmpty) {
  //       Snack.show(
  //           content: "Booking status or ID is missing.",
  //           snackType: SnackType.error,
  //           behavior: SnackBarBehavior.floating);
  //       isLoading.value = false;
  //       return;
  //     }

  //     Map<String, dynamic> body = {
  //       "booking_status_id": bookingStatusId,
  //       "booking_status": bookingStatus,
  //     };

  //     String bodyJson = jsonEncode(body);

  //     final response = await ApiHandler()
  //         .callConsumerBookingStatusURL(token, bodyJson, bookingStatusId);

  //     isLoading.value = false;

  //     if (response != null) {
  //       Snack.show(
  //           content: "Booking Status Updated Successfully",
  //           snackType: SnackType.success,
  //           behavior: SnackBarBehavior.floating);
  //     } else {
  //       Snack.show(
  //           content: "Failed to Update Booking Status",
  //           snackType: SnackType.error,
  //           behavior: SnackBarBehavior.floating);
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     Snack.show(
  //         content: "Error: $e",
  //         snackType: SnackType.error,
  //         behavior: SnackBarBehavior.floating);
  //   }
  // }

  /////commented code ////

  Future<void> getConsumerBookingStatus(BuildContext context) async {
    try {
      isLoading.value = true;
      final token = await Utils().ReadToken();
      final bookingStatusId = '5';
      final bookingStatus = 'Accepted';

      final response = await ApiHandler().callConsumerBookingStatusURL(
        token!,
        bookingStatusId,
        bookingStatus,
      );
      isLoading.value = false;

      if (response != null) {
        Snack.show(
            content: "Booking Status Updated Successfully",
            snackType: SnackType.success,
            behavior: SnackBarBehavior.floating);
      } else {
        Snack.show(
            content: "Failed to Update Booking Status",
            snackType: SnackType.error,
            behavior: SnackBarBehavior.floating);
      }
    } catch (e) {
      isLoading.value = false;
      Snack.show(
          content: "Error: $e",
          snackType: SnackType.error,
          behavior: SnackBarBehavior.floating);
    }
  }
}
