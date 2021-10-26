String ageFormatter(int age) {
  return '${age.toString()} ${age > 1 ? 'anos' : 'ano'}';
}
