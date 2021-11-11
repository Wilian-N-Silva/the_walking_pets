import 'dart:convert';

import 'package:intl/intl.dart';

class AnimalClass {
  AnimalClass(
      {this.id,
      this.photo,
      required this.specie,
      required this.name,
      this.birth,
      required this.uid,
      required this.gender});

  final int? id;
  final int? specie;
  final String? name;
  final String? photo;
  final DateTime? birth;
  final int? uid;
  final int? gender;

  factory AnimalClass.fromJson(Map<String, dynamic> json) => AnimalClass(
      id: json["id"] as int,
      specie: json["specie"] as int,
      name: json["name"] as String,
      photo: json["photo"] ?? '',
      birth: DateTime.parse(json["birth"] as String),
      uid: json["uid"] as int,
      gender: json["gender"] as int);

  String toJson() => json.encode(toMap());

  factory AnimalClass.fromMap(Map<String, dynamic> json) => AnimalClass(
      id: json["id"] as int,
      specie: json["specie"] as int,
      name: json["name"] as String,
      photo: json["photo"] as String,
      birth: DateTime.parse(json["birth"] as String),
      uid: json["uid"] as int,
      gender: json["gender"] as int);

  Map<String, dynamic> toMap() => {
        // "id": id,
        "specie": specie,
        "name": name,
        "photo": photo,
        "birth": DateFormat('yyyy-MM-dd').format(birth!).toString(),
        "uid": uid,
        "gender": gender
      };
}
