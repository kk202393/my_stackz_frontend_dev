import 'dart:convert';

import 'package:http/http.dart' as http;

class CloudFunctionService {
  // Replace with your actual Firebase Cloud Function URL
  final String cloudFunctionUrl =
      'https://us-central1-mystackz-2a351.cloudfunctions.net/sendNotificationToProviders';

  // Method to call the Firebase Cloud Function
  Future<void> sendNotificationToProviders(List<String> providerIds,
      String title, String body, Map<String, dynamic> data) async {
    try {
      // Create the request body
      final requestBody = jsonEncode({
        'providerIds': providerIds,
        'title': title,
        'body': body,
        'data': data,
      });

      // Send HTTP POST request to the Firebase Cloud Function
      final response = await http.post(
        Uri.parse(cloudFunctionUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      // Check the response status
      if (response.statusCode == 200) {
        print('Notification sent successfully');
        print('Response: ${response.body}');
      } else {
        print('Failed to send notification: ${response.body}');
      }
    } catch (error) {
      print('Error sending notification: $error');
    }
  }
}
