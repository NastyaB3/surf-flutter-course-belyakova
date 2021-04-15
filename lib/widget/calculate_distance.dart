import 'dart:math';

class LatLng {
  double lat;
  double lng;

  LatLng(this.lat, this.lng);
}

class PositionNear {
  static bool arePointsNear(LatLng checkPoint, LatLng centerPoint, double km) {
    var ky = 40000 / 360;
    var kx = cos(pi * centerPoint.lat / 180.0) * ky;
    var dx = ((centerPoint.lng - checkPoint.lng) * kx).abs();
    var dy = ((centerPoint.lat - checkPoint.lat) * ky).abs();
    return sqrt(dx * dx + dy * dy) <= km;
  }

  static bool arePointsFar(LatLng checkPoint, LatLng centerPoint, double km) {
    var ky = 40000 / 360;
    var kx = cos(pi * centerPoint.lat / 180.0) * ky;
    var dx = ((centerPoint.lng - checkPoint.lng) * kx).abs();
    var dy = ((centerPoint.lat - checkPoint.lat) * ky).abs();
    return sqrt(dx * dx + dy * dy) >= km;
  }
}
