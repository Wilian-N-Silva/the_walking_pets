import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/services/service_category.dart';

List<PartnerCategory> partnerCategoryData(BuildContext context) {
  return [
    PartnerCategory(
      id: 1,
      titulo: 'Veterinário',
      icone: Icons.local_hospital,
    ),
    PartnerCategory(
      id: 2,
      titulo: 'Veterinário de Exóticos',
      icone: Icons.local_hospital_outlined,
    ),
    PartnerCategory(
      id: 3,
      titulo: 'Transporte',
      icone: Icons.delivery_dining,
    ),
    PartnerCategory(
      id: 4,
      titulo: 'Banho e Tosa',
      icone: Icons.shower,
    ),
    PartnerCategory(
      id: 5,
      titulo: 'Pet Shop',
      icone: Icons.store,
    ),
  ];
}
