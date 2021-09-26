import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/service_category.dart';

List<ServiceCategory> serviceCategoryData(BuildContext context) {
  return [
    ServiceCategory(
      titulo: 'Veterinário',
      icone: Icons.local_hospital,
    ),
    ServiceCategory(
      titulo: 'Veterinário de Exóticos',
      icone: Icons.local_hospital_outlined,
    ),
    ServiceCategory(
      titulo: 'Transporte',
      icone: Icons.delivery_dining,
    ),
    ServiceCategory(
      titulo: 'Banho e Tosa',
      icone: Icons.shower,
    ),
    ServiceCategory(
      titulo: 'Pet Shop',
      icone: Icons.store,
    ),
  ];
}
