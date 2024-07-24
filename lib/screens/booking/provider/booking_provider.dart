import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/bookingDetails/views/booking_details_view.dart';
import 'package:my_stackz/utils/utils.dart';

class BookingProvider with ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ValueNotifier<int> count = ValueNotifier<int>(0);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  BookingResponse? _response;

  BookingResponse get bookingResponse => _response!;

  Future<bool> callBookingPageApi(BuildContext context) async {
    isLoading.value = true;
    notifyListeners();

    try {
      String? token = await Utils().ReadToken();
      final response = await ApiHandler().callConsumerBookingApi(token!);
      isLoading.value = false;
      notifyListeners();

      if (response.success) {
        if (response.consumerOrderDetails.consumerBookingStatus.bookingStatus !=
            null) {
          notifyListeners();
          Navigator.pushNamed(context, Routes.BOOKING_DETAILS);
          return true;
        }
      }
      return false;
    } catch (e) {
      isLoading.value = false;
      notifyListeners();
      return false;
    }
  }

  // Future<bool> callBookingPageApi(BuildContext context) async {
  //   isLoading.value = true;
  //   try {
  //     String? token = await Utils().ReadToken();
  //     final response = await ApiHandler().callConsumerBookingApi(token!);
  //     isLoading.value = false;

  //     if (response.success == true) {
  //       final responseBody = json.decode(response.body);
  //       final responseModel = BookingResponse.fromJson(responseBody);

  //       if (responseModel.success &&
  //           responseModel.consumerOrderDetails.consumerBookingStatus != null) {
  //         notifyListeners();
  //         Navigator.pushNamed(context, Routes.BOOKING_DETAILS);
  //         return true;
  //       }
  //     }
  //     return false;
  //   } catch (e) {
  //     isLoading.value = false;
  //     return false;
  //   }
  // }
  //   Future<bool> callBookingPageApi(BuildContext context) async {
  //   isLoading.value = true;
  //   try {
  //     String? token = await Utils().ReadToken();
  //     _response = await ApiHandler().callConsumerBookingApi(token!);
  //     isLoading.value = false;
  //     if (_response!.success && _response!.consumerOrderDetails.consumerBookingStatus != null) {
  //       notifyListeners();
  //       return true;
  //     }
  //     return true;
  //   } catch (e) {
  //     isLoading.value = false;
  //     return false;
  //   }

  // }
}
