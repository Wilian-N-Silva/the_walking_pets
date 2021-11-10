import 'dart:convert';

import 'package:intl/intl.dart';

class AnimalClass {
  AnimalClass({
    this.id,
    required this.specie,
    required this.name,
    this.birth,
    required this.uid,
  });

  final int? id;
  final int? specie;
  final String? name;
  final DateTime? birth;
  final int? uid;

  factory AnimalClass.fromJson(Map<String, dynamic> json) => AnimalClass(
        id: json["id"] as int,
        specie: json["specie"] as int,
        name: json["name"] as String,
        birth: DateTime.parse(json["birth"] as String),
        uid: json["uid"] as int,
      );

  String toJson() => json.encode(toMap());

  factory AnimalClass.fromMap(Map<String, dynamic> json) => AnimalClass(
        id: json["id"] as int,
        specie: json["specie"] as int,
        name: json["name"] as String,
        birth: DateTime.parse(json["birth"] as String),
        uid: json["uid"] as int,
      );

  Map<String, dynamic> toMap() => {
        // "id": id,
        "specie": specie,
        "name": name,
        "birth": DateFormat('yyyy-MM-dd').format(birth!).toString(),
        "uid": uid,
      };
}
