import 'package:places/mocks.dart';

class Sight {
  String name;
  double lat;
  double lon;
  String photo;
  String detailPhoto;
  String details;
  String type;
  SightType typeEnum;

  Sight({this.name, this.type, this.lat, this.lon, this.details, this.photo, this.typeEnum, this.detailPhoto});

}