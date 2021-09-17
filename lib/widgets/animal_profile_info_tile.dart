import 'package:flutter/material.dart';

Widget animalProfileInfoTile(String title, String subtitle, IconData leading) {
  return ListTile(
    leading: Icon(leading),
    title: Text(title),
    subtitle: Text(subtitle.toString()),
  );
}
