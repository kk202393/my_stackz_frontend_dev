import 'package:flutter/material.dart';

class BookingDetailsView extends StatelessWidget {
  const BookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookingDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookingDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );

  }
}