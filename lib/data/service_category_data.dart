import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/service_category.dart';

List<ServiceCategory> serviceCategoryData(BuildContext context) {
  return [
    ServiceCategory(
      id: 1,
      titulo: 'Veterinário',
      icone: Icons.local_hospital,
    ),
    ServiceCategory(
      id: 2,
      titulo: 'Veterinário de Exóticos',
      icone: Icons.local_hospital_outlined,
    ),
    ServiceCategory(
      id: 3,
      titulo: 'Transporte',
      icone: Icons.delivery_dining,
    ),
    ServiceCategory(
      id: 4,
      titulo: 'Banho e Tosa',
      icone: Icons.shower,
    ),
    ServiceCategory(
      id: 5,
      titulo: 'Pet Shop',
      icone: Icons.store,
    ),
  ];
}
