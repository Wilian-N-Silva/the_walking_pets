import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareAnimalProfile(BuildContext context, String animalName) {
  return Share.share(
    'O "$animalName" está a procura de um lar no projeto The Walking Pets!\nhttps://www.thewalkingpets.com.br/adoption/id',
  );
}
