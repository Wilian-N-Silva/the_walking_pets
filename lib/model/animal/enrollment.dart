// To parse this JSON data, do
//
//     final enrollment = enrollmentFromMap(jsonString);

import 'dart:convert';

import 'package:the_walking_pets/model/animal/adoption.dart';
import 'package:the_walking_pets/model/user.dart';

class Enrollment {
  Enrollment({
    this.id,
    required this.uid,
    required this.adoptionId,
    required this.alreadyAdopted,
    required this.haveChild,
    required this.houseOwnership,
    required this.houseTypeId,
    required this.jobCategoryId,
    required this.numResidents,
    required this.onTravelId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.adoption,
    this.user,
  });

  int? id;
  final int uid;
  final int adoptionId;
  final bool alreadyAdopted;
  final bool haveChild;
  final bool houseOwnership;
  final int houseTypeId;
  final int jobCategoryId;
  final int numResidents;
  final int onTravelId;
  final int? status;
  final AdoptionClass? adoption;
  final User? user;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  // factory Enrollment.fromJson(String str) =>
  //     Enrollment.fromMap(json.decode(str));

  factory Enrollment.fromJson(Map<String, dynamic> json) => Enrollment(
        id: json["id"],
        uid: json["uid"],
        adoptionId: json["adoption_id"],
        alreadyAdopted: json["already_adopted"],
        haveChild: json["have_child"],
        houseOwnership: json["house_ownership"],
        houseTypeId: json["house_type_id"],
        jobCategoryId: json["job_category_id"],
        numResidents: json["num_residents"],
        onTravelId: json["on_travel_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        adoption: AdoptionClass.fromMap(json["adoption"]),
        user: User.fromMap(json["user"]),
      );

  String toJson() => json.encode(toMap());

  factory Enrollment.fromMap(Map<String, dynamic> json) => Enrollment(
        id: json["id"],
        uid: json["uid"],
        adoptionId: json["adoption_id"],
        alreadyAdopted: json["already_adopted"],
        haveChild: json["have_child"],
        houseOwnership: json["house_ownership"],
        houseTypeId: json["house_type_id"],
        jobCategoryId: json["job_category_id"],
        numResidents: json["num_residents"],
        onTravelId: json["on_travel_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        adoption: AdoptionClass.fromMap(json["adoption"]),
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "adoption_id": adoptionId,
        "uid": uid,
        "num_residents": numResidents,
        "job_category_id": jobCategoryId,
        "have_child": haveChild,
        "already_adopted": alreadyAdopted,
        "on_travel_id": onTravelId,
        "house_type_id": houseTypeId,
        "house_ownership": houseOwnership,
      };
}
