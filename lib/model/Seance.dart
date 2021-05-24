import 'package:cinema/model/Categorie.dart';
import 'package:cinema/model/Salle.dart';

class Seance {
  int id;
  DateTime heureDebut;
  Salle salle;

  Seance(this.id, this.heureDebut, this.salle);

  @override
  String toString() {
    return 'Seance{id: $id, heureDebut: $heureDebut, salle: $salle}';
  }

  Seance.fromJson(Map<String, dynamic> json) {
    this.id = json["id"] as int;
    this.heureDebut = json["heureDebut"] != null
        ? DateTime.parse(json['heureDebut'] as String)
        : null;
    this.salle = json["salle"] != null ? Salle.fromJson(json["salle"]) : null;

    //this.categories = json["categories"]!=null?Categorie.fromJson(json["categories"]):null;
  }
}
