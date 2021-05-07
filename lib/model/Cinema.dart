import 'package:cinema/tools/tool.dart';
import 'dart:core';

class Cinema {
  int _id;
  String _name;
  double _longitude;
  double _latitude;
  double _altitude;
  int _nombreSalles;
  Cinema(this._id, this._name, this._longitude, this._latitude, this._altitude,
      this._nombreSalles);

  Cinema.fromJson(Map<String, dynamic> json) {
    _id = json["id"] != null ? json["id"] as int : null;
    _altitude = json["altitude"] != null ? json["altitude"] as double : null;
    _longitude = json["longitude"] != null ? json["longitude"] as double : null;
    _latitude = json["latitude"] != null ? json["latitude"] as double : null;
    _name = json["name"] != null ? json["name"] as String : null;
    _nombreSalles =
        json["nombreSalles"] != null ? json["nombreSalles"] as int : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    if (this._id != null) map["id"] = this._id;
    if (this._name.isNullEmptyOrWhitespace) map["name"] = this._name;
    if (this._nombreSalles != null) map["nombreSalles"] = this._nombreSalles;
    if (this._latitude != null) map["latitude"] = this._latitude;
    if (this._longitude != null) map["longitude"] = this._longitude;
    if (this._altitude != null) map["altitude"] = this._altitude;

    return map;
  }

  int get id => _id;

  int get nombreSalles => _nombreSalles;

  double get altitude => _altitude;

  double get latitude => _latitude;

  double get longitude => _longitude;

  String get name => _name;
}
