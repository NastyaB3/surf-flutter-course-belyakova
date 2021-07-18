import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/dio_data.dart';

class PlaceRepository {
  Future<List<Place>> createPlace(
    double lng,
    double lat,
    String name,
    List<String> urls,
    String placeType,
    String description,
  ) async {
    final res = await dio.post<Iterable>('/place', data: {
      "lat": lat,
      "lng": lng,
      "name": name,
      "urls": urls,
      "placeType": placeType,
      "description": description,
    });
    final places = res.data.map((e) => Place.fromJson(e)).toList();
    return places;
  }

  Future<List<Place>> getPlaces(
    int count,
    int offset,
    String pageBy,
    String pageAfter,
    String pagePrior,
    List<String> sortBy,
  ) async {
    final res = await dio.get<Iterable>('/place', queryParameters: {
      'count': count,
      'offset': offset,
      'pageBy': pageBy,
      ' pageAfter': pageAfter,
      'pagePrior': pagePrior,
      'sortBy': sortBy,
    });
    final places = res.data.map((e) => Place.fromJson(e)).toList();
    return places;
  }

  Future<Place> getPlaceById({
    @required String id,
  }) async {
    final res = await dio.get(
      '/place/$id',
    );
    final place = Place.fromJson(res.data);
    return place;
  }

  Future<void> deletePlaceById({
    @required String id,
  }) async {
    await dio.delete(
      '/place/$id',
    );
  }

  Future<Place> putPlaceById({
    @required String id,
  }) async {
    final res = await dio.put('/place/$id');
    final place = Place.fromJson(res.data);
    return place;
  }
}
