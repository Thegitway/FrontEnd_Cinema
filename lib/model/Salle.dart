import 'package:cinema/model/Categorie.dart';
import 'package:cinema/model/Cinema.dart';

class Salle {
  int id;
  String name;
  int nombreDePlaces;
  Cinema cinema;

  @override
  String toString() {
    return 'Salle{id: $id, name: $name, nombreDePlaces: $nombreDePlaces, cinema: $cinema}';
  }

  Salle.fromJson(Map<String, dynamic> json) {
    this.id = json["id"] as int;
    this.name = json["name"].toString();
    this.nombreDePlaces = json["nombreDePlaces"] as int;
    this.cinema =
        json["cinema"] != null ? Cinema.fromJson(json["cinema"]) : null;
    //this.categories = json["categories"]!=null?Categorie.fromJson(json["categories"]):null;
  }

  Salle(this.id, this.name, this.nombreDePlaces, this.cinema);
}
