class User {
  int id;
  String email;
  String nome;
  DateTime? dtNasc;
  String? telefone;
  String? celular;

  User({
    required this.id,
    required this.email,
    required this.nome,
    this.dtNasc,
    this.telefone,
    this.celular,
  });
}
