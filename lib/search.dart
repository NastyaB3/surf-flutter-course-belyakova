import 'package:places/domain/sight.dart';

import 'mocks.dart';
import 'dart:math';

class Search {
  static SightType type;

  static double defaultPositionFrom = 100;
  static double defaultPositionTo = 10000;

  static double positionFrom = defaultPositionFrom;
  static double positionTo = defaultPositionTo;

  static var filters = {
    SightType.cafe: true,
    SightType.hotel: true,
    SightType.museum: true,
    SightType.particularPlace: true,
    SightType.park: true,
    SightType.restaurant: true,
  };

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

  static List<Sight> search({
    String query,
    double positionFrom,
    double positionTo,
    Map<SightType, bool> filters,
  }) {
    final userPosition = LatLng(55.753600, 37.621094);
    final nearsPlaces = <Sight>[];

    mocks.forEach((element) {
      final kmFrom = positionFrom / 1000;
      final kmTo = positionTo / 1000;

      final isNear = Search.arePointsNear(
        LatLng(element.lat, element.lon),
        userPosition,
        kmTo,
      );
      final isFar = Search.arePointsFar(
        LatLng(element.lat, element.lon),
        userPosition,
        kmFrom,
      );

      final isSelected = filters[element.typeEnum];
      final isSearch = query == null
          ? true
          : element.name.toLowerCase().contains(query.toLowerCase());

      if (isNear && isFar && isSelected && isSearch) {
        nearsPlaces.add(element);
      }
    });

    return nearsPlaces;
  }
}

class LatLng {
  double lat;
  double lng;

  LatLng(this.lat, this.lng);
}
