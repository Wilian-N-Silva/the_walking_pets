import 'package:flutter/material.dart';
import 'package:the_walking_pets/data/service_category_data.dart';
import 'package:the_walking_pets/model/service.dart';

List<Service> serviceData(BuildContext context) {
  return [
    Service(
      nome: 'UniVet',
      endereco: '',
      categoria: serviceCategoryData(context).elementAt(0),
    ),
    Service(
      nome: 'Lava Rápido Bom pra Cachorro',
      endereco: '',
      categoria: serviceCategoryData(context).elementAt(3),
    ),
    Service(
      nome: 'Vet IX de Julho',
      endereco: '',
      categoria: serviceCategoryData(context).elementAt(1),
    ),
    Service(
      nome: 'Doglivery',
      endereco: '',
      categoria: serviceCategoryData(context).elementAt(2),
    ),
  ];
}
