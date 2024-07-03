import 'package:flutter/material.dart';

class CancellationView extends StatelessWidget {
  const CancellationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CancellationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CancellationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}