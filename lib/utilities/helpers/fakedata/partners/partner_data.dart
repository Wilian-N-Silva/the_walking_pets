import 'package:flutter/material.dart';
import 'package:the_walking_pets/utilities/helpers/fakedata/partners/partner_category_data.dart';
import 'package:the_walking_pets/model/services/service.dart';

List<Partner> partnerData(BuildContext context) {
  return [
    Partner(
      nome: 'UniVet',
      // UNINOVE CAMPUS SANTO AMARO
      lat: -23.65326430615493,
      lng: -46.71171568804511,
      postalCode: '04752-900',
      address: 'R. Amador Bueno',
      number: '389/491',
      neighborhood: 'Santo Amaro',
      location: 'São Paulo',
      state: 'SP',
      categoria: partnerCategoryData(context)
          .where((element) => element.id == 1)
          .first,
      premium: false,
    ),
    Partner(
      // UNINOVE CAMPUS VERGUEIRO
      nome: 'Bom pra Cachorro',
      lat: -23.564080268829915,
      lng: -46.638072393193546,
      postalCode: '01525-000',
      address: 'Rua Vergueiro',
      number: '235/249',
      neighborhood: 'Liberdade',
      location: 'São Paulo',
      state: 'SP',
      categoria: partnerCategoryData(context)
          .where((element) => element.id == 4)
          .first,
      premium: false,
    ),
    Partner(
      // UNINOVE CAMPUS MEMORIAL
      nome: 'Vet IX de Julho',
      lat: -23.529132873439977,
      lng: -46.66625387982924,
      postalCode: '',
      address: 'Av. Dr. Adolpho Pinto',
      number: '109',
      neighborhood: 'Barra Funda',
      location: 'São Paulo',
      state: 'SP',
      categoria: partnerCategoryData(context)
          .where((element) => element.id == 2)
          .first,
      premium: false,
    ),
    Partner(
      // UNINOVE CAMPUS VILA PRUDENTE
      nome: 'Doglivery',
      lat: -23.584003906326636,
      lng: -46.581088060157114,
      postalCode: '03155-000',

      address: 'Av. Professor Luiz Ignácio Anhaia Mello',
      number: '1363',
      neighborhood: 'Vila Prudente',
      location: 'São Paulo',
      state: 'SP',
      categoria: partnerCategoryData(context)
          .where((element) => element.id == 3)
          .first,
      premium: false,
    ),
  ];
}
