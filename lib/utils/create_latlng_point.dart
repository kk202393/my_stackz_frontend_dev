import 'dart:math';

class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
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
