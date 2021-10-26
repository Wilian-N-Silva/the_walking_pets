import 'package:flutter/material.dart';

class ProfileSettings {
  ProfileSettings({
    required this.title,
    required this.icon,
    required this.route,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final Widget route;
}
