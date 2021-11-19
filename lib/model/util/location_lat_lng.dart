import 'dart:convert';

class LocationLatLng {
  LocationLatLng({
    this.lat,
    this.lng,
  });

  final double? lat;
  final double? lng;

  factory LocationLatLng.fromJson(Map<String, dynamic> json) => LocationLatLng(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  String toJson() => json.encode(toMap());

  factory LocationLatLng.fromMap(Map<String, dynamic> json) => LocationLatLng(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
      };
}
