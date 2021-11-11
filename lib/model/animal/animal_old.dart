class AnimalOld {
  final int? id;
  final int? userId;
  final String? nome;
  final String? especie;
  final String? sexo;
  final String? porte;
  final String? temperamento;
  final String? pelagem;
  final String? cor;
  final DateTime? nascimento;
  final bool? castrado;
  final bool? vacinado;
  final bool perdido;
  final bool achado;
  final String? identificacao;
  final String? foto;

  AnimalOld({
    this.id,
    this.userId,
    this.nome,
    this.especie,
    this.nascimento,
    this.sexo,
    this.pelagem,
    this.cor,
    this.porte,
    this.identificacao,
    this.temperamento,
    this.castrado,
    this.vacinado,
    required this.perdido,
    required this.achado,
    required this.foto,
  });
}
