// ignore_for_file: must_be_immutable, prefer_collection_literals, deprecated_member_use

import 'dart:async';
import 'dart:math';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_stackz/constants/app_images.dart';

class GoogleMapView extends StatefulWidget {
  StreamController streamController;
  Position position;
  GoogleMapView({
    super.key,
    required this.streamController,
    required this.position,
  });

  @override
  State<GoogleMapView> createState() => GoogleMapViewState();
}

class GoogleMapViewState extends State<GoogleMapView> {
  late GoogleMapController mapController;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  List<LatLng> intermediatePoints = [];
  late BitmapDescriptor icons;

  final LatLng _start = const LatLng(28.5685406, 77.3700148);
  final LatLng _end = const LatLng(28.636589, 77.274315);
  final List<Marker> _markers = const [
    Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(28.5685406, 77.3700148),
      infoWindow: InfoWindow(
        title: 'Marker 1',
        snippet: 'This is marker 1',
      ),
    ),
    Marker(
      markerId: MarkerId('marker_2'),
      position: LatLng(28.636589, 77.274315),
      infoWindow: InfoWindow(
        title: 'Marker 2',
        snippet: 'This is marker 2',
      ),
    ),
  ];

  final Map<PolylineId, Polyline> _polylines = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    // _onMapCreated(mapController);
    intermediatePoints = getIntermediatePoints(_start, _end, 50);
    List<LatLng> latLongPoint = intermediatePoints
        .where((element) => !element.latitude.isNaN || !element.longitude.isNaN)
        .toList();

    // _polylines.add(
    //   Polyline(
    //     polylineId: const PolylineId('polyline_1'),
    //     points: latLongPoint,
    //     color: Colors.blue,
    //     width: 5,
    //   ),
    // );
    PolylineId id = const PolylineId("Poly");
    Polyline polyLine = Polyline(
      polylineId: id,
      color: Colors.green,
      points: latLongPoint,
      width: 4,
    );
    _polylines[id] = polyLine;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      icons = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio:10,size: Size(10, 10)),
        AppImages.bikeIcon,
      );
    });

    return StreamBuilder(
        stream: widget.streamController.stream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Provider Tracking'),
            ),
            body: GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              onTap: (position) {
                _customInfoWindowController.hideInfoWindow!();
              },
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove!();
              },
              markers: Set<Marker>.from([
                Marker(
                  markerId: const MarkerId('marker_1'),
                  icon: icons,
                  position: LatLng(
                    snapshot.hasData ? snapshot.data.latitude : 28.5685406,
                    snapshot.hasData ? snapshot.data.longitude : 77.3700148,
                  ),
                  infoWindow: const InfoWindow(
                    title: 'Marker 1',
                    snippet: 'This is marker 1',
                  ),
                ),
              ]),
              // polylines: Set<Polyline>.from(_polylines.values),
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    snapshot.hasData ? snapshot.data.latitude : 28.5685406,
                    snapshot.hasData
                        ? snapshot.data.longitude
                        : 77.3700148),
                zoom: 20.0,
              ),
            ),
          );
        });
  }
}

List<LatLng> getIntermediatePoints(
    LatLng start, LatLng end, int numberOfPoints) {
  List<LatLng> points = [];

  double lat1 = start.latitude * pi / 180.0;
  double lon1 = start.longitude * pi / 180.0;
  double lat2 = end.latitude * pi / 180.0;
  double lon2 = end.longitude * pi / 180.0;

  for (int i = 0; i <= numberOfPoints; i++) {
    double fraction = i / numberOfPoints;

    double deltaLat = lat2 - lat1;
    double deltaLon = lon2 - lon1;

    double a = sin((1 - fraction) * deltaLat / 2) *
            sin((1 - fraction) * deltaLat / 2) +
        cos(lat1) *
            cos(lat2) *
            sin((1 - fraction) * deltaLon / 2) *
            sin((1 - fraction) * deltaLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double A = sin((1 - fraction) * c) / sin(c);
    double B = sin(fraction * c) / sin(c);

    double x = A * cos(lat1) * cos(lon1) + B * cos(lat2) * cos(lon2);
    double y = A * cos(lat1) * sin(lon1) + B * cos(lat2) * sin(lon2);
    double z = A * sin(lat1) + B * sin(lat2);

    double interpolatedLat = atan2(z, sqrt(x * x + y * y));
    double interpolatedLon = atan2(y, x);

    points.add(
        LatLng(interpolatedLat * 180.0 / pi, interpolatedLon * 180.0 / pi));
  }

  return points;
}
