import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/utils/utils.dart';

class PollingProvider with ChangeNotifier {
  final Dio _dio = Dio();
  String _bookingStatus = 'pending'; // initial status
  bool _isLoading = true;
  // String _bearerToken =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzA1NmUzMjMxNjY1ZWI2NDVkOWI4NWYiLCJpYXQiOjE3Mjg0MTMyNTEsImV4cCI6MTcyOTcwOTI1MX0.NkBdkNigGZc5hYwwDkwmTpdqMof1A_xVcEImV5kkbtk"; // Replace with actual token

  String? _bearerToken = '';

  Future<void> setBearerToken() async {
    _bearerToken = await Utils().ReadToken() ?? '';
  }

  String get bookingStatus => _bookingStatus;
  bool get isLoading => _isLoading;

  Future<void> startPolling(String bookingId) async {
    const int pollingDuration = 240; // 4 minutes in seconds
    const int pollingInterval = 5; // polling every 5 seconds
    int elapsedTime = 0;

    print('Starting polling for booking ID: $bookingId');
    Timer.periodic(Duration(seconds: pollingInterval), (timer) async {
      if (elapsedTime >= pollingDuration ||
          _bookingStatus == 'true' ||
          _bookingStatus == 'false') {
        print(
            'Stopping polling. Elapsed time: $elapsedTime seconds, Booking status: $_bookingStatus');
        timer.cancel();
        _setLoading(false);
        return;
      }

      print('Polling attempt at $elapsedTime seconds');
      await _pollBookingStatus(bookingId);
      elapsedTime += pollingInterval;
    });
  }

  Future<void> _pollBookingStatus(String bookingId) async {
    final url =
        'http://cospazes.com/api/v1/currentbookingstatus'; // Replace with your polling URL
    final headers = {
      'Authorization': 'Bearer $_bearerToken',
      'Content-Type': 'application/json',
    };

    try {
      print('Sending request to $url with booking ID: $bookingId');
      final response = await _dio.post(url,
          options: Options(headers: headers), data: {'booking_id': bookingId});

      if (response.statusCode == 200) {
        final data = response.data;
        bool currentBookingStatus = data['currentBookingStatus'];

        if (currentBookingStatus == true) {
          _bookingStatus = 'true';
        } else if (currentBookingStatus == false) {
          _bookingStatus = 'true';
        } else {
          _bookingStatus = 'pending';
        }
        print('Received response: $data');
      } else {
        _bookingStatus = 'error';
        print('Error: Received status code ${response.statusCode}');
      }
    } catch (e) {
      _bookingStatus = 'error';
      print('Error: $e');
    }

    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    print('Loading state changed: $_isLoading');
    notifyListeners();
  }
}
