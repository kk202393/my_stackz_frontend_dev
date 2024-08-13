import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/models/home_page_response.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/home/controllers/home_controller.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:provider/provider.dart';

class BookingProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ValueNotifier<int> count = ValueNotifier<int>(0);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  BookingResponse? _response;

  BookingResponse get bookingResponse => _response!;

  ValueNotifier<int> serviceCategoryId = ValueNotifier<int>(-1);
  ValueNotifier<int> subCategoryId = ValueNotifier<int>(-1);
  ValueNotifier<int> categoryId = ValueNotifier<int>(-1);
  ValueNotifier<String> bookingDate = ValueNotifier<String>("");
  ValueNotifier<String> timeSlotId = ValueNotifier<String>("");
  ValueNotifier<String> bookingId = ValueNotifier<String>("");
  ValueNotifier<String> useraddressId = ValueNotifier<String>("");

  Future<bool> callBookingPageApi(BuildContext context) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> body = {
        "servicecategory_id": serviceCategoryId.value,
        "subcategory_id": subCategoryId.value,
        "category_id": categoryId.value,
        "booking_date": bookingDate.value,
        "time_slot_id": timeSlotId.value,
        "useraddress_id": useraddressId.value,
      };

      // Make the API call and pass the body
      LoginResponse? _response =
          await ApiHandler().callConsumerBookingApi(body);
      print("Request Body: $body");

      isLoading.value = false;
      notifyListeners();

      print("response=$_response");

      if (_response != null && _response.success) {
        // Navigate to the booking details page if the response is successful
        Navigator.pushNamed(context, Routes.BOOKING_DETAILS);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      isLoading.value = false;
      notifyListeners();
      return false;
    }
  }
}
