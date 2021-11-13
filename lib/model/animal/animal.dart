import 'dart:convert';

import 'package:intl/intl.dart';

class Animal {
  Animal({
    required this.uid,
    required this.name,
    required this.specie,
    required this.gender,
    required this.size,
    required this.temperament,
    required this.coat,
    required this.color,
    required this.birth,
    this.id,
    this.photo,
    this.photoBlurhash,
    this.microchip,
    this.isVacinated,
    this.isCastrated,
    this.castrationDate,
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
  final DateTime? castrationDate;
  final bool? isVacinated;
  final bool? isCastrated;

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        id: json["id"] as int,
        specie: json["specie"] as int,
        name: json["name"] as String,
        photo: json["photo"] ?? '',
        photoBlurhash: json["photo_blurhash"] ?? '',
        birth: DateTime.parse(json["birth"] as String),
        castrationDate: json["castration_date"] != null
            ? DateTime.parse(json["castration_date"] as String)
            : null,
        uid: json["uid"] as int,
        gender: json["gender"] as int,
        size: json["size"] as int,
        temperament: json["temperament"] as int,
        coat: json["coat"] as int,
        color: json["color"] as String,
        isCastrated: json["is_castrated"] as bool,
        isVacinated: json["is_vacinated"] as bool,
      );

  String toJson() => json.encode(toMap());

  factory Animal.fromMap(Map<String, dynamic> json) => Animal(
        id: json["id"] as int,
        specie: json["specie"] as int,
        name: json["name"] as String,
        photo: json["photo"] ?? '',
        photoBlurhash: json["photo_blurhash"] ?? '',
        birth: DateTime.parse(json["birth"] as String),
        castrationDate: json["castration_date"] != null
            ? DateTime.parse(json["castration_date"] as String)
            : null,
        uid: json["uid"] as int,
        gender: json["gender"] as int,
        size: json["size"] as int,
        temperament: json["temperament"] as int,
        coat: json["coat"] as int,
        color: json["color"] as String,
        isCastrated: json["is_castrated"] as bool,
        isVacinated: json["is_vacinated"] as bool,
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
        "castration_date": isCastrated != null
            ? castrationDate != null
                ? DateFormat('yyyy-MM-dd').format(castrationDate!).toString()
                : null
            : null,
        "size": size,
        "temperament": temperament,
        "coat": coat,
        "color": color,
        "microchip": microchip,
        "isVacinated": isVacinated,
        "isCastrated": isCastrated,
      };
}
