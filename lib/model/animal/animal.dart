import 'dart:convert';

import 'package:intl/intl.dart';

class Animal {
  Animal({
    required this.uid,
    required this.name,
    required this.specie,
    required this.gender,
    required this.birth,
    required this.size,
    required this.temperament,
    required this.coat,
    required this.color,
    this.id,
    this.photo,
    this.photoBlurhash,
    this.microchip,
    this.isVacinated,
    this.isCastrated,
  });

  final int? id;
  final int? specie;
  final int? uid;
  final int? gender;
  final int? size;
  final int? temperament;
  final int? coat;
  final String? name;
  final String? photo;
  final String? photoBlurhash;
  final String? color;
  final String? microchip;
  final DateTime? birth;
  final bool? isVacinated;
  final bool? isCastrated;

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        id: json["id"] as int,
        specie: json["specie"] as int,
        name: json["name"] as String,
        photo: json["photo"] ?? '',
        photoBlurhash: json["photo_blurhash"] ?? '',
        birth: DateTime.parse(json["birth"] as String),
        uid: json["uid"] as int,
        gender: json["gender"] as int,
        size: json["size"] as int,
        temperament: json["temperament"] as int,
        coat: json["coat"] as int,
        color: json["color"] as String,
      );

  String toJson() => json.encode(toMap());

  factory Animal.fromMap(Map<String, dynamic> json) => Animal(
        id: json["id"] as int,
        specie: json["specie"] as int,
        name: json["name"] as String,
        photo: json["photo"] ?? '',
        photoBlurhash: json["photo_blurhash"] ?? '',
        birth: DateTime.parse(json["birth"] as String),
        uid: json["uid"] as int,
        gender: json["gender"] as int,
        size: json["size"] as int,
        temperament: json["temperament"] as int,
        coat: json["coat"] as int,
        color: json["color"] as String,
      );

  Map<String, dynamic> toMap() => {
        // REQUIRED
        "name": name,
        "specie": specie,
        "gender": gender,
        "uid": uid,
        // OPTIONAL
        // "id": id,
        "photo": photo,
        "photo_blurhash": photoBlurhash,
        "birth": DateFormat('yyyy-MM-dd').format(birth!).toString(),
        "size": size,
        "temperament": temperament,
        "coat": coat,
        "color": color,
        "microchip": microchip,
        "isVacinated": isVacinated,
        "isCastrated": isCastrated,
      };
}
