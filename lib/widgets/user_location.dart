// ignore_for_file: library_private_types_in_public_api, void_checks

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_stackz/routes/app_pages.dart';
import 'package:my_stackz/screens/googleMap/view/google_map.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  StreamController streamController = StreamController.broadcast();
  late Timer _timer;
  late Position position;

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    streamController.sink.add(position);
    setState(() {
      locationMessage =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
  }

  @override
  void initState() {
    super.initState();
    // streamController.stream.listen((_) {
    //   _getCurrentLocation();
    // });
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
          _getCurrentLocation();
        // streamController.add(null);
      },
    );
  }

  @override
  void dispose() {
    // _timer.cancel();
    // streamController.close();
    super.dispose();
  }

  String locationMessage = "";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.GOOGLE_MAP,
          arguments: {
            "streamController": streamController,
            "position": position
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          Text(locationMessage),
        ],
      ),
    );
  }
}
