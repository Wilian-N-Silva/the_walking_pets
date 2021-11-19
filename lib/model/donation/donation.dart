import 'dart:convert';

import 'package:the_walking_pets/model/animal/animal.dart';

class AdoptionClass {
  AdoptionClass({
    required this.animal,
    required this.idAnimal,
    required this.isOpen,
    required this.idPartner,
    required this.id,
    required this.location,
  });

  final Animal? animal;
  final int? idAnimal;
  final bool? isOpen;
  final int? idPartner;
  final int? id;
  final String? location;

  factory AdoptionClass.fromJson(Map<String, dynamic> json) => AdoptionClass(
        animal: Animal.fromMap(json["animal"]),
        idAnimal: json["id_animal"],
        isOpen: json["is_open"],
        idPartner: json["id_partner"],
        id: json["id"],
        location: json["location"],
      );

  String toJson() => json.encode(toMap());

  factory AdoptionClass.fromMap(Map<String, dynamic> json) => AdoptionClass(
        animal: Animal.fromMap(json["animal"]),
        idAnimal: json["id_animal"],
        isOpen: json["is_open"],
        idPartner: json["id_partner"],
        id: json["id"],
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "animal": animal!.toMap(),
        "id_animal": idAnimal,
        "is_open": isOpen,
        "id_partner": idPartner,
        "id": id,
        "location": location,
      };
}
