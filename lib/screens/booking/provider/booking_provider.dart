import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/api/api_handler.dart';
import 'package:my_stackz/models/consumer_booking_response.dart';
import 'package:my_stackz/widgets/snack_bar.dart';

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
    // String? selectedDateString,
    String? selectedTimeSlotId,
    String? selectedAddressId,
    int? selectedAddressIndexValue,
  ) async {
    {
      isLoading.value = true;
      Map<String, dynamic> body = {
        "servicecategory_id": serviceCategoryId.value,
        "subcategory_id": subCategoryId.value,
        "category_id": categoryId.value,
        "booking_date": bookingDate.value,
        "time_slot_id": timeSlotId.value,
        "useraddress_id": selectedAddressId,
      };

      try {
        _response = await ApiHandler().callConsumerBookingApi(body, context);

        // call notification api
        // polling api
        return true;
      } catch (e) {
        debugPrint("Unexpected error occurred: $e");
        return false;
      } finally {
        isLoading.value = false;
        notifyListeners();
      }
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
      final response = await ApiHandler().updateUserBookingStatus(body,context);

      // debugPrint('API response: ${response?.toJson()}');
      if (response != null) {
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
}
