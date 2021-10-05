import 'package:the_walking_pets/model/services/service_category.dart';

class Partner {
  Partner({
    required this.nome,
    required this.coordLat,
    required this.coordLng,
    required this.categoria,
  });

  final String nome;
  final double coordLat;
  final double coordLng;
  final PartnerCategory categoria;
}
