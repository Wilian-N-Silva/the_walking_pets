import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal.dart';

class AnimalProfile extends StatefulWidget {
  const AnimalProfile({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  _AnimalProfileState createState() => _AnimalProfileState();
}

class _Tile {
  _Tile({
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  final String title;
  final String subtitle;
  final IconData leading;
}

class _AnimalProfileState extends State<AnimalProfile> {
  @override
  Widget build(BuildContext context) {
    List<_Tile> tileDataSource = [
      _Tile(
        title: 'Idade',
        subtitle: widget.animal.idade.toString(),
        leading: Icons.cake,
      ),
      _Tile(
        title: 'Castrado',
        subtitle: (widget.animal.castrado ? 'Sim' : 'Não'),
        leading: Icons.health_and_safety,
      ),
      _Tile(
        title: 'Porte',
        subtitle: widget.animal.porte.toString(),
        leading: Icons.swap_horiz_outlined,
      ),
      _Tile(
        title: 'Altura',
        subtitle: widget.animal.altura.toString(),
        leading: Icons.height,
      ),
      _Tile(
        title: 'Peso',
        subtitle: widget.animal.peso.toString(),
        leading: Icons.monitor_weight,
      ),
      _Tile(
        title: 'Pelagem',
        subtitle: widget.animal.pelagem.toString(),
        leading: Icons.color_lens_outlined,
      ),
      _Tile(
        title: 'Temperamento',
        subtitle: widget.animal.temperamento.toString(),
        leading: Icons.mood,
      ),
      _Tile(
        title: 'Espécie',
        subtitle: widget.animal.especie.toString(),
        leading: Icons.local_offer,
      ),
      _Tile(
        title: 'Raça',
        subtitle: widget.animal.raca.toString(),
        leading: Icons.invert_colors_rounded,
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            margin: const EdgeInsets.only(top: 300.0),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: tileDataSource.length,
              itemBuilder: (BuildContext context, int index) {
                return infoTile(
                    tileDataSource[index].title,
                    tileDataSource[index].subtitle,
                    tileDataSource[index].leading);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget infoTile(String title, String subtitle, IconData leading) {
  return ListTile(
    leading: Icon(leading),
    title: Text(title),
    subtitle: Text(subtitle.toString()),
  );
}
