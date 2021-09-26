import 'package:the_walking_pets/model/service_category.dart';

class Service {
  Service({
    required this.nome,
    required this.endereco,
    required this.categoria,
  });

  final String nome;
  final String endereco;
  final ServiceCategory categoria;
}
