import 'package:flutter/material.dart';

class ServiceCategory {
  ServiceCategory({
    required this.id,
    required this.titulo,
    required this.icone,
  });

  final int id;
  final String titulo;
  final IconData icone;
}
