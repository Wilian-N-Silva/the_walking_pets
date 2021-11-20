String ageFormatter(DateTime date) {
  Duration difference = date.difference(DateTime.now());
  // log('Nascimento: ${date.toString()}');
  // log('Data atual: ${DateTime.now().toString()}');

  var days = difference.inDays.abs();
  var years = (difference.inDays / 365).abs().floor();
  var months = (difference.inDays / 30).abs().floor();

  // log('Diferença em anos: ${years.toString()}');
  // log('Diferença em meses: ${months.toString()}');
  // log('Diferença em dias: ${days.toString()}');

  if (years > 0) {
    return '$years ${years == 1 ? 'ano' : 'anos'}';
  } else if (months > 0) {
    return '$months ${months == 1 ? 'mês' : 'meses'}';
  } else {
    return '$days ${days == 1 ? 'dia' : 'dias'}';
  }
}
