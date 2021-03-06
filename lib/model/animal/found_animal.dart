class FoundAnimal {
  FoundAnimal({
    this.nome,
    this.altura,
    this.peso,
    this.especie,
    this.raca,
    this.sexo,
    this.idade,
    this.pelagem,
    this.porte,
    this.temperamento,
    required this.castrado,
    required this.vacinado,
    required this.foto,
    this.perdido,
    this.identificacao,
  });

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
  final bool castrado;
  final bool vacinado;
  final String foto;
  final bool? perdido;
  final String? identificacao;
}
