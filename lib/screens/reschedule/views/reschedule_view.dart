import 'package:flutter/material.dart';

class RescheduleView extends StatelessWidget {
  const RescheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RescheduleView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RescheduleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}