import 'package:cinema/model/Movie.dart';
import 'package:cinema/model/Seance.dart';

class ProjectionFilm {
  int id;
  DateTime dateProjection;
  double prix;
  Seance seance;
  Movie movie;

  ProjectionFilm.fromJson(Map<String, dynamic> json) {
    this.id = json["id"] as int;
    this.movie = json["film"] != null ? Movie.fromJson(json["film"]) : null;
    this.prix = json["prix"] as double;
    this.seance =
        json["seance"] != null ? Seance.fromJson(json["seance"]) : null;
    this.dateProjection = json["dateProjection"] != null
        ? DateTime.parse(json['dateProjection'] as String)
        : null;
    //this.categories = json["categories"]!=null?Categorie.fromJson(json["categories"]):null;
  }

  ProjectionFilm(
      this.id, this.dateProjection, this.prix, this.seance, this.movie);
}
