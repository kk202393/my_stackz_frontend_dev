import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_stackz/screens/booking/provider/booking_provider.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatelessWidget {
  final String? requestId;
  final String? userName;
  final String serviceProviderId = '67056ece31665eb645d9b87c';
  final Dio _dio = Dio();
// booking id, username(optioal)
  ProviderScreen({this.requestId, this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Request'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Request ID: $requestId',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'User Name: $userName',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.check),
                      label: Text('Accept'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      onPressed: () => _showConfirmationDialog(context, true),
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.close),
                      label: Text('Reject'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      onPressed: () => _showConfirmationDialog(context, false),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, bool isAccepted) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isAccepted ? 'Accept Request' : 'Reject Request'),
          content: Text(
            isAccepted
                ? 'Are you sure you want to accept this request?'
                : 'Are you sure you want to reject this request?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _handleRequest(context, isAccepted);
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _handleRequest(BuildContext context, bool isAccepted) async {
    BookingProvider bookingProvider =
        Provider.of<BookingProvider>(context, listen: false);
    String userId =
        bookingProvider.bookingAPIResponse?.userDeviceInfo!.userId.toString() ??
            '';
    final url = 'http://cospazes.com/api/v1/userasigntoprovider';
    final data = {
      "booking_id": requestId.toString().trim(), // booking id
      // "service_provider_id":
      //     '67056ece31665eb645d9b87c', //using from shared preference user id
      "service_provider_id":
          userId.toString().trim, //using from shared preference user id
    };

    try {
      final response = await _dio.put(url, data: data);

      if (response.statusCode == 200) {
        _showResult(
            context, isAccepted ? 'Request Accepted' : 'Request Rejected');
      } else {
        _showResult(context, 'Failed to update request status');
      }
    } catch (e) {
      _showResult(context, 'Error: ${e.toString()}');
    }
  }

  void _showResult(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
