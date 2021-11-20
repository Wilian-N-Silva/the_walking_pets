import 'dart:convert';

import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/model/util/address.dart';

class AdoptionClass {
  AdoptionClass({
    this.createdAt,
    this.id,
    this.updatedAt,
    this.observations,
    this.isOpen,
    this.idPartner,
    this.idAddress,
    this.idAnimal,
    this.animal,
    this.address,
  });

  final DateTime? createdAt;
  final int? id;
  final DateTime? updatedAt;
  final String? observations;
  final bool? isOpen;
  final int? idPartner;
  final int? idAddress;
  final int? idAnimal;
  final Animal? animal;
  final Address? address;

  factory AdoptionClass.fromJson(String str) =>
      AdoptionClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdoptionClass.fromMap(Map<String, dynamic> json) => AdoptionClass(
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        observations: json["observations"],
        isOpen: json["is_open"],
        idPartner: json["id_partner"],
        idAddress: json["id_address"],
        idAnimal: json["id_animal"],
        animal: Animal.fromMap(json["animal"]),
        address: Address.fromMap(json["address"]),
      );

  Map<String, dynamic> toMap() => {
        "created_at": createdAt!.toIso8601String(),
        "id": id,
        "updated_at": updatedAt!.toIso8601String(),
        "observations": observations,
        "is_open": isOpen,
        "id_partner": idPartner,
        "id_address": idAddress,
        "id_animal": idAnimal,
        "animal": animal!.toMap(),
        "address": address!.toMap(),
      };
}
