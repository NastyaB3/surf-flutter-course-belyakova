import 'package:places/mocks.dart';

class Sight {
  String name;
  double lat;
  double lon;
  String url;
  String url_2;
  String details;
  String type;
  SightType typeEnum;

  Sight({this.name, this.type, this.lat, this.lon, this.details, this.url, this.typeEnum, this.url_2});

}