import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_walking_pets/model/animal.dart';
import 'package:the_walking_pets/widgets/animal_profile_info_tile.dart';

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
    final animal = widget.animal;

    final List<_Tile> tileDataSource = [
      _Tile(
          title: 'Localização',
          subtitle: 'São Paulo - SP',
          leading: Icons.location_on),
      _Tile(
        title: 'Espécie',
        subtitle: animal.especie.toString(),
        leading: Icons.local_offer,
      ),
      _Tile(
        title: 'Raça',
        subtitle: animal.raca.toString(),
        leading: Icons.invert_colors_rounded,
      ),
      _Tile(
        title: 'Idade',
        subtitle: animal.idade.toString(),
        leading: Icons.cake,
      ),
      _Tile(
        title: 'Temperamento',
        subtitle: animal.temperamento ?? 'Sem informações',
        leading: Icons.mood,
      ),
      _Tile(
        title: 'Castrado',
        subtitle: (animal.castrado ? 'Sim' : 'Não'),
        leading: Icons.local_hospital,
      ),
      _Tile(
        title: 'Vacinado',
        subtitle: (animal.castrado ? 'Sim' : 'Não'),
        leading: Icons.health_and_safety,
      ),
      _Tile(
        title: 'Sexo',
        subtitle: animal.sexo.toString(),
        leading: animal.sexo.toString().toLowerCase() == 'macho'
            ? Icons.male
            : Icons.female,
      ),
      _Tile(
        title: 'Porte',
        subtitle: animal.porte.toString(),
        leading: Icons.swap_horiz_outlined,
      ),
      _Tile(
        title: 'Altura',
        subtitle: (animal.altura ?? 'Sem informações').toString(),
        leading: Icons.height,
      ),
      _Tile(
        title: 'Peso',
        subtitle: (animal.peso ?? 'Sem informações').toString(),
        leading: Icons.monitor_weight,
      ),
      _Tile(
        title: 'Pelagem',
        subtitle: animal.pelagem ?? 'Sem informações',
        leading: Icons.color_lens_outlined,
      ),
    ];

    int screenHeight = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Stack(
            children: [
              SizedBox(
                height: screenHeight / 2,
                width: double.infinity,
                child: Hero(
                    tag: 'animal',
                    child: Image.asset(
                      animal.foto.toString(),
                      fit: BoxFit.cover,
                    )),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(
                  18.0,
                  36.0,
                  18.0,
                  0.0,
                ),
                color: Colors.black38,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      animal.nome.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        shareProfile(context, animal.nome.toString());
                      },
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: (screenHeight / 2) - 25),
                height: 50.0,
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Adote-me!'),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                        const Size(128, 48.0),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightBlueAccent.shade400,
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: (screenHeight / 2) + 25),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: tileDataSource.length,
              itemBuilder: (BuildContext context, int index) {
                return animalProfileInfoTile(
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

Future<void> shareProfile(BuildContext context, String animalName) {
  return Share.share(
    'O "$animalName" está a procura de um lar no projeto The Walking Pets!\nhttps://www.thewalkingpets.com.br/adoption/id',
  );
}
