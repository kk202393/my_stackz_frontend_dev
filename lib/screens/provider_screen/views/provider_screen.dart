import 'package:flutter/material.dart';

class ProviderScreen extends StatelessWidget {
  final String? requestId;
  final String? userName;

  ProviderScreen({this.requestId, this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Request ID: $requestId'),
            Text('User Name: $userName'),
          ],
        ),
      ),
    );
  }
}
