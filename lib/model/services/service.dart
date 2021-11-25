import 'package:the_walking_pets/model/services/service_category.dart';

class Partner {
  Partner({
    required this.nome,
    required this.lat,
    required this.lng,
    required this.categoria,
    required this.premium,
    required this.postalCode,
    required this.address,
    required this.neighborhood,
    required this.location,
    required this.state,
    required this.number,
  });

  final String nome;
  final PartnerCategory categoria;

  final String postalCode;
  final String address;
  final String neighborhood;
  final String location;
  final String state;
  final String number;
  final double lat;
  final double lng;
  final bool premium;
}
