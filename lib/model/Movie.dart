import 'package:cinema/model/Categorie.dart';

class Movie {
  int id;
  String titre;
  double duree;
  String realisateur;
  String description;
  String photo;
  DateTime dateSortie;
  List<Categorie> categories;

  Movie(this.id, this.titre, this.duree, this.realisateur, this.description,
      this.photo, this.dateSortie, this.categories);

  @override
  String toString() {
    return 'Movie{id: $id, titre: $titre, duree: $duree, realisateur: $realisateur, description: $description, photo: $photo, dateSortie: $dateSortie, categories: $categories}';
  }

  Movie.fromJson(Map<String, dynamic> json) {
    this.id = json["id"] as int;
    this.titre = json["id"].toString();
    this.duree = json["duree"] as double;
    this.realisateur = json["realisateur"].toString();
    this.description = json["description"].toString();
    this.photo = json["dateSortie"].toString();
    this.dateSortie = json["dateSortie"] != null
        ? DateTime.parse(json['dateSortie'] as String)
        : null;
    //this.categories = json["categories"]!=null?Categorie.fromJson(json["categories"]):null;
  }
}
