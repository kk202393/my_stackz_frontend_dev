import 'dart:convert';
import 'dart:ffi';

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

 Future<bool> updateBookingStatus(BuildContext context) async {
  isLoading.value = true;

  final Map<String, dynamic> body = {
    "booking_id": "CMS0003", // Static booking ID
    "booking_status_id": "4", // Static booking status ID (4 = Complete)
  };

  try {
    // Call the API to update the booking status
    final response = await ApiHandler().updateUserBookingStatus(body);

    // Debug print for the full API response
    debugPrint('Full API response: ${response?.toJson()}');

    // Check if the response is not null and the success flag is true
    if (response?.success == true) {
      // Retrieve the updated status
      final updatedStatus = response?.consumerOrderDetails.consumerBookingStatus?.bookingStatus;

      if (updatedStatus == null) {
        debugPrint('Updated status is null');
        _showSnackBar(context, 'Updated status is null', SnackType.error);
        return false;
      }

      // Convert status to a user-friendly string
      final bookingStatus = _getStatusString(updatedStatus);

      debugPrint('Booking updated successfully: $bookingStatus');
      _showSnackBar(context, 'Booking updated to: $bookingStatus', SnackType.success);

      return true;
    } else {
      // Handle failure case
      debugPrint('Failed to update booking: ${response?.massage ?? 'Unknown error'}');
      _showSnackBar(context, 'Failed to update booking: ${response?.massage ?? 'Unknown error'}', SnackType.error);
    }
  } catch (e) {
    // Handle any exceptions that occur
    debugPrint('Error while updating booking: $e');
    _showSnackBar(context, 'Error occurred while updating booking', SnackType.error);
  } finally {
    // Ensure that the loading state is turned off and listeners are notified
    isLoading.value = false;
    notifyListeners();
  }

  return false;
}

String _getStatusString(String? bookingStatus) {
  switch (bookingStatus) {
    case '1':
      return 'Pending';
    case '2':
      return 'Accepted';
    case '3':
      return 'Underprocess';
    case '4':
      return 'Complete';
    default:
      return 'Unknown Status';
  }
}


//   Future<bool> updateBookingStatus(BuildContext context) async {
//     isLoading.value = true;

//     // Static data for the request body
//     final Map<String, dynamic> body = {
//       "booking_id": "CMS0003", // Static booking ID
//       "booking_status_id": "4", // Static booking status ID (4 = Complete)
//     };

//     try {
//       final response = await ApiHandler().updateUserBookingStatus(body);

//       // Print the API response for debugging
//       debugPrint('API response: ${response?.toJson()}');

//       // Check if the response is successful
//       if (response != null && response.success) {
//         // Get the booking status from the response
//         final updatedStatus =
//             response.consumerOrderDetails?.consumerBookingStatus?.bookingStatus;

//         // Ensure updatedStatus is not null
//         if (updatedStatus == null) {
//           debugPrint('Updated status is null');
//           _showSnackBar(context, 'Updated status is null', SnackType.error);
//           return false;
//         }

//         // Convert the booking status ID to a readable string
//         final bookingStatus = _getStatusString(updatedStatus);

//         // Print and show success message
//         debugPrint('Booking updated successfully: $bookingStatus');
//         _showSnackBar(
//             context, 'Booking updated to: $bookingStatus', SnackType.success);

//         return true;
//       } else {
//         debugPrint(
//             'Failed to update booking: ${response?.massage ?? 'Unknown error'}');
//         _showSnackBar(
//             context,
//             'Failed to update booking: ${response?.massage ?? 'Unknown error'}',
//             SnackType.error);
//       }
//     } catch (e, stacktrace) {
//       debugPrint('Error while updating booking: $e');
//       debugPrint('Stacktrace: $stacktrace');
//       _showSnackBar(
//           context, 'Error occurred while updating booking', SnackType.error);
//     } finally {
//       isLoading.value = false;
//       notifyListeners();
//     }

//     return false;
//   }

// // Helper function to map the booking status to a status string
//   String _getStatusString(String bookingStatus) {
//     switch (bookingStatus) {
//       case '1':
//         return 'Pending';
//       case '2':
//         return 'Accepted';
//       case '3':
//         return 'Underprocess';
//       case '4':
//         return 'Complete';
//       default:
//         return 'Unknown Status';
//     }
//   }

// Function to show a SnackBar message
  void _showSnackBar(BuildContext context, String content, SnackType type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: type == SnackType.success ? Colors.green : Colors.red,
      ),
    );
  }
}
