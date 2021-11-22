String ageFormatter(DateTime date) {
  Duration difference = date.difference(DateTime.now());

  int days = difference.inDays.abs();
  int years = (difference.inDays / 365).abs().floor();
  int months = (difference.inDays / 30).abs().floor();

  if (years > 0) {
    return '$years ${years == 1 ? 'ano' : 'anos'}';
  } else if (months > 0) {
    return '$months ${months == 1 ? 'mês' : 'meses'}';
  } else {
    return '$days ${days == 1 ? 'dia' : 'dias'}';
  }
}
