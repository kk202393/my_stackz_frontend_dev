import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/models/login_response.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:my_stackz/widgets/snack_bar.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/utils/utils.dart';
import 'package:dio/dio.dart';

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
  ValueNotifier<String> bookingStatusId = ValueNotifier<String>("");

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
    int? selectedAddressIndexValue,
  ) async {
    isLoading.value = true;

    serviceCategoryId.value = serviceCategory;
    subCategoryId.value = subCategory;
    categoryId.value = category;
    bookingDate.value = selectedDateString ?? "";
    timeSlotId.value = selectedTimeSlotId ?? "";
    useraddressId.value = selectedAddressId ?? "";
    selectedAddressIndex.value = selectedAddressIndexValue ?? 1;

    final Map<String, dynamic> body = {
      "servicecategory_id": serviceCategoryId.value,
      "subcategory_id": subCategoryId.value,
      "category_id": categoryId.value,
      "booking_date": bookingDate.value,
      "time_slot_id": timeSlotId.value,
      "useraddress_id": useraddressId.value,
    };

    try {
      final response = await ApiHandler().callConsumerBookingApi(body);

      debugPrint('API response: $response');

      if (response != null && response["success"] == true) {
        _response = BookingResponse.fromJson(response);
        bookingId.value = _response!.consumerOrderDetails.bookingId;
        notifyListeners();
        return true;
      } else {
        debugPrint("Booking failed. Response: $response");
        return false;
      }
    } on DioException catch (dioError) {
      debugPrint("DioException occurred: ${dioError.message}");

      if (dioError.response != null) {
        debugPrint("DioException response data: ${dioError.response!.data}");
        debugPrint(
            "DioException response headers: ${dioError.response!.headers}");
      }

      return false;
    } catch (e) {
      debugPrint("Unexpected error occurred: $e");
      return false;
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }

  Future<bool> updateBookingStatus(
      BuildContext context, String? bookingStatusId, String? bookingId) async {
    isLoading.value = true;

    final Map<String, dynamic> body = {
      "booking_status_id": bookingStatusId ?? "",
      "booking_id": bookingId ?? "",
    };

    if (body['booking_status_id']!.isEmpty || body['booking_id']!.isEmpty) {
      debugPrint('Booking status ID or booking ID is missing');
      _showSnackBar(context, 'Booking status ID or booking ID is missing',
          SnackType.error);
      isLoading.value = false;
      notifyListeners();
      return false;
    }

    try {
      final response = await ApiHandler().updateUserBookingStatus(body);

      debugPrint('API response: ${response?.toJson()}');
      if (response != null && response.success) {
        final updatedStatus =
            response.consumerOrderDetails?.consumerBookingStatus;

        if (updatedStatus == null) {
          debugPrint('Updated status is null');
          _showSnackBar(context, 'Updated status is null', SnackType.error);
          return false;
        }

        debugPrint('Booking updated successfully: $updatedStatus');
        _showSnackBar(
            context, 'Booking updated successfully!', SnackType.success);

        return true;
      } else {
        debugPrint(
            'Failed to update booking: ${response?.massage ?? 'Unknown error'}');
        _showSnackBar(
            context,
            'Failed to update booking: ${response?.massage ?? 'Unknown error'}',
            SnackType.error);
      }
    } catch (e, stacktrace) {
      debugPrint('Error while updating booking: $e');
      debugPrint('Stacktrace: $stacktrace');
      _showSnackBar(
          context, 'Error occurred while updating booking', SnackType.error);
    } finally {
      isLoading.value = false;
      notifyListeners();
    }

    return false;
  }

  void _showSnackBar(BuildContext context, String content, SnackType type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: type == SnackType.success ? Colors.green : Colors.red,
      ),
    );
  }
}

void _showSnackBar(BuildContext context, String content, SnackType type) {}
