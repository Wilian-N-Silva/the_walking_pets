import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal.dart';

List<Animal> animalData(BuildContext context) {
  return [
    Animal(
      nome: 'Juninho',
      especie: 'Canino',
      raca: 'SRD',
      idade: 3,
      porte: 'Mini',
      castrado: true,
      vacinado: true,
      sexo: 'Macho',
      temperamento: 'Dócil',
      foto: 'assets/placeholder_pets/dog/5.jpg',
      pelagem: null,
    ),
  ];
}
