import 'package:the_walking_pets/model/service_category.dart';

class Service {
  Service({
    required this.nome,
    required this.coordLat,
    required this.coordLng,
    required this.categoria,
  });

  final String nome;
  final double coordLat;
  final double coordLng;
  final ServiceCategory categoria;
}
