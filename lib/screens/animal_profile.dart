import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal.dart';
import 'package:the_walking_pets/widgets/curve_clipper.dart';

class _Animal {
  _Animal({
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
    this.castrado,
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
  final bool? castrado;
  final String foto;
  final bool? perdido;
  final String? identificacao;
}

class AnimalProfile extends StatefulWidget {
  const AnimalProfile({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  _AnimalProfileState createState() => _AnimalProfileState();
}

class _AnimalProfileState extends State<AnimalProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.animal.nome.toString()),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.blue,
      //   foregroundColor: Colors.white,
      // ),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Hero(
                    tag: 'animal',
                    child: Image.asset(
                      widget.animal.foto.toString(),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 45.0,
                ),
                // child: SizedBox(
                //   height: 50.0,
                //   width: double.infinity,
                //   child: Stack(
                //     children: [
                //       IconButton(
                //         onPressed: () {
                //           Navigator.pop(context);
                //         },
                //         icon: const Icon(
                //           Icons.arrow_back,
                //           color: Colors.white,
                //         ),
                //       ),
                //       SizedBox(
                //         height: 50,
                //         width: double.infinity,
                //         child: Center(
                //           child: Text(
                //             widget.animal.nome.toString(),
                //             style: const TextStyle(
                //               color: Colors.white,
                //               fontSize: 20.0,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      widget.animal.nome.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      widget.animal.sexo.toString().toLowerCase() == 'macho'
                          ? Icons.male
                          : Icons.female,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Porte: ${widget.animal.porte}'),
                Text('Temperamento: ${widget.animal.temperamento}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
