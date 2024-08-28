import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
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

  setBookingDate(String value) {
    bookingDate.value = value;
  }

  setTimeSlotId(String value) {
    timeSlotId.value = value;
  }

  setUserAddressId(String value) {
    useraddressId.value = value;
  }

  setSelectedAddressIndex(int? value) {
    selectedAddressIndex.value = value;
  }

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
        Navigator.pushNamed(context, Routes.BOOKING_DETAILS);
        return true;
      } else {
        print("API Response is not successful or not of BookingResponse type");
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      notifyListeners();
      print("Error: $e");
      return false;
    }
  }
}
