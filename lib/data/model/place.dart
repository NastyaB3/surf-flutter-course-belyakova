class Place {
  String id;
  double lat;
  double lng;
  String name;
  List<String> urls;
  String placeType;
  String description;

  Place.fromJson(Map<String, dynamic> json)
      : lat = json['lat'],
        lng = json['lng'],
        name = json['name'],
        placeType = json['placeType'],
        urls = json['urls'],
        description = json['description'];
}
