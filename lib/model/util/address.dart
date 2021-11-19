import 'dart:convert';

class Address {
  Address({
    this.id,
    this.uid,
    this.postalCode,
    this.address,
    this.neighborhood,
    this.location,
    this.state,
    this.lat,
    this.lng,
    this.number,
  });

  final String? postalCode;
  final String? address;
  final String? neighborhood;
  final String? location;
  final String? state;
  final String? number;
  final double? lat;
  final double? lng;
  final int? uid;
  final int? id;

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        address: json["address"] as String,
        id: json["id"] as int,
        lat: double.parse(json["lat"]).toDouble(),
        lng: double.parse(json["lng"]).toDouble(),
        location: json["location"] as String,
        number: json["number"] as String,
        neighborhood: json["neighborhood"] as String,
        postalCode: json["postal_code"] as String,
        state: json["state"] as String,
        uid: json["uid"] as int,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "postal_code": postalCode,
        "address": address,
        "neighborhood": neighborhood,
        "location": location,
        "state": state,
        "number": number,
        "lat": lat.toString(),
        "lng": lng.toString(),
      };
}
