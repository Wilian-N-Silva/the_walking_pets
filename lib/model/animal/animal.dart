class Animal {
  final int? id;
  final int? userId;
  final String? nome;
  final double? altura;
  final double? peso;
  final String? especie;
  final String? raca;
  final String? sexo;
  final int? idade;
  final String? pelagem;
  final String? porte;
  final String? temperamento;
  final String? identificacao;
  final bool? castrado;
  final bool? vacinado;
  final bool? hasOwner;
  final String foto;
  final bool perdido;
  final bool achado;
  final bool? doacaoconjunta;
  final bool? lartemporario;

  Animal({
    this.id,
    this.userId,
    this.hasOwner,
    this.nome,
    this.altura,
    this.peso,
    this.especie,
    this.raca,
    this.sexo,
    this.idade,
    this.pelagem,
    this.porte,
    this.identificacao,
    this.temperamento,
    this.castrado,
    this.vacinado,
    required this.foto,
    required this.perdido,
    required this.achado,
    this.doacaoconjunta,
    this.lartemporario,
  });
}
