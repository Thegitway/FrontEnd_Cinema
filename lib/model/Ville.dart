import 'package:cinema/tools/tool.dart';

class Ville {
  int id;
  String name;
  double longitude;
  double latitude;
  double altitude;

  Ville(this.id, this.name, this.longitude, this.latitude, this.altitude);

  Ville.fromJson(Map<String, dynamic> json) {
    this.id = json["id"] as int;
    this.altitude = json["altitude"] as double;
    this.latitude = json["latitude"] as double;
    this.longitude = json["longitude"] as double;
    this.name = json["name"].toString();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};

    if (this.id != null) {
      map["id"] = this.id;
    }

    if (!this.name.isNullEmptyOrWhitespace) {
      map["name"] = this.name.toString();
    }

    if (this.altitude != null) {
      map["altitude"] = this.altitude;
    }

    if (this.longitude != null) {
      map["longitude"] = this.longitude;
    }

    if (this.latitude != null) {
      map["latitude"] = this.latitude;
    }

    return map;
  }
}
