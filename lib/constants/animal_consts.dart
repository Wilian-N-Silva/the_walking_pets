class AnimalConsts {
  static const List<String> gender = ['Macho', 'Fêmea'];
  static const List<String> species = [
    'Canina',
    'Felina',
  ];
  static const List<String> size = [
    'Mini',
    'Pequeno',
    'Médio',
    'Grande',
    'Gigante'
  ];

  static const List<String> coats = [
    // dog
    'Curta',
    'Dupla pelagem',
    'Dura e ou pelo de arame',
    'Longa e encaracolada',
    'Longa e lisa',
    'Longa, Sedosa e sem ondulações',
    'Outras',
    // cat
    'Curta',
    'Muito curta',
    'Semi-Longo',
    'Longa',
    'Encaracolado',
    'Outras'
  ];

  static List<String> dogCoat = AnimalConsts.coats.getRange(0, 7).toList();
  static List<String> catCoat = AnimalConsts.coats.getRange(7, 13).toList();

  static const List<String> temperament = [
    'Calmo',
    'Dócil',
    'Reservado',
    'Agitado',
    'Agressivo'
  ];
}
