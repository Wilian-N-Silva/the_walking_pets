import 'package:flutter/material.dart';
import 'package:the_walking_pets/data/service_category_data.dart';
import 'package:the_walking_pets/model/service.dart';

List<Service> serviceData(BuildContext context) {
  return [
    Service(
      nome: 'UniVet',
      coordLat: -23.65326430615493,
      coordLng: -46.71171568804511,
      categoria: serviceCategoryData(context).elementAt(0),
    ),
    Service(
      nome: 'Lava Rápido Bom pra Cachorro',
      coordLat: -23.564080268829915,
      coordLng: -46.638072393193546,
      categoria: serviceCategoryData(context).elementAt(3),
    ),
    Service(
      nome: 'Vet IX de Julho',
      coordLat: -23.529132873439977,
      coordLng: -46.66625387982924,
      categoria: serviceCategoryData(context).elementAt(1),
    ),
    Service(
      nome: 'Doglivery',
      coordLat: -23.584003906326636,
      coordLng: -46.581088060157114,
      categoria: serviceCategoryData(context).elementAt(2),
    ),
  ];
}
