import 'dart:convert';

import 'package:intl/intl.dart';

class AnimalClass {
  AnimalClass({
    this.id,
    this.name,
    this.specie,
    this.knownBirthday,
    this.birth,
    this.ownerId,
  });

  final int? id;
  final int? specie;
  final String? name;
  final bool? knownBirthday;
  final DateTime? birth;
  final int? ownerId;

  // factory AnimalClass.fromJson(Map<String, dynamic> json) => AnimalClass(
  //       id: json["id"] as int,
  //       specie: json["specie"] as int,
  //       name: json["name"] as String,
  //       knownBirthday: json["known_birthday"] as bool,
  //       birth: DateTime.parse(json["birth"] as String),
  //       ownerId: json["owner_id"] as int,
  //     );

  factory AnimalClass.fromJson(String str) =>
      AnimalClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AnimalClass.fromMap(Map<String, dynamic> json) => AnimalClass(
        id: json["id"],
        specie: json["specie"],
        name: json["name"],
        knownBirthday: json["known_birthday"],
        birth: DateTime.parse(json["birth"]),
        ownerId: json["owner_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "specie": specie,
        "name": name,
        "known_birthday": knownBirthday,
        "birth": DateTime.now().toString(),
        "owner_id": ownerId,
      };
}
