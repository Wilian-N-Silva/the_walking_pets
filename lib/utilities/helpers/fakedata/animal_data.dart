import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal_old.dart';

List<AnimalOld> animalData(BuildContext context) {
  return [
    AnimalOld(
      foto: 'assets/images/placeholder_pets/dog/1.jpg',
      achado: false,
      perdido: false,
    ),
    AnimalOld(
      nome: 'Mel',
      especie: 'Canino',
      porte: 'Médio',
      castrado: true,
      vacinado: true,
      sexo: 'Fêmea',
      temperamento: 'Dócil',
      foto: 'assets/images/placeholder_pets/dog/3.jpg',
      pelagem: null,
      achado: false,
      perdido: false,
    ),
    AnimalOld(
      userId: 1,
      nome: 'Juninho',
      especie: 'Canino',
      porte: 'Mini',
      castrado: true,
      vacinado: true,
      sexo: 'Macho',
      temperamento: 'Dócil',
      foto: 'assets/images/placeholder_pets/dog/5.jpg',
      pelagem: null,
      achado: false,
      perdido: false,
    ),
  ];
}
