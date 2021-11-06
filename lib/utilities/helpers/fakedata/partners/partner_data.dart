import 'package:flutter/material.dart';
import 'package:the_walking_pets/utilities/helpers/fakedata/partners/partner_category_data.dart';
import 'package:the_walking_pets/model/services/service.dart';

List<Partner> partnerData(BuildContext context) {
  return [
    Partner(
      nome: 'UniVet',
      // UNINOVE CAMPUS SANTO AMARO
      coordLat: -23.65326430615493,
      coordLng: -46.71171568804511,
      categoria: partnerCategoryData(context)
          .where((element) => element.id == 1)
          .first,
      premium: false,
    ),
    Partner(
      // UNINOVE CAMPUS VERGUEIRO
      nome: 'Bom pra Cachorro',
      coordLat: -23.564080268829915,
      coordLng: -46.638072393193546,
      categoria: partnerCategoryData(context)
          .where((element) => element.id == 4)
          .first,
      premium: false,
    ),
    Partner(
      // UNINOVE CAMPUS MEMORIAL
      nome: 'Vet IX de Julho',
      coordLat: -23.529132873439977,
      coordLng: -46.66625387982924,
      categoria: partnerCategoryData(context)
          .where((element) => element.id == 2)
          .first,
      premium: false,
    ),
    Partner(
      // UNINOVE CAMPUS VILA PRUDENTE
      nome: 'Doglivery',
      coordLat: -23.584003906326636,
      coordLng: -46.581088060157114,
      categoria: partnerCategoryData(context)
          .where((element) => element.id == 3)
          .first,
      premium: false,
    ),
  ];
}
