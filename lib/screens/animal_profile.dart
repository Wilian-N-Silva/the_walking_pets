import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
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
    final animal = widget.animal;

    List<_Tile> tileDataSource = [
      _Tile(
        title: 'Idade',
        subtitle: animal.idade.toString(),
        leading: Icons.cake,
      ),
      _Tile(
        title: 'Castrado',
        subtitle: (animal.castrado ? 'Sim' : 'Não'),
        leading: Icons.health_and_safety,
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
      _Tile(
        title: 'Temperamento',
        subtitle: animal.temperamento ?? 'Sem informações',
        leading: Icons.mood,
      ),
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
        title: 'Sexo',
        subtitle: animal.sexo.toString(),
        leading: animal.sexo.toString().toLowerCase() == 'macho'
            ? Icons.male
            : Icons.female,
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
                      animal.foto.toString(),
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
                        shareAnimal(context, animal.nome.toString());
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
                margin: const EdgeInsets.only(top: 275.0),
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
                        Colors.blue,
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
            margin: const EdgeInsets.only(top: 325.0),
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

Future<void> shareAnimal(BuildContext context, String animalName) {
  return Share.share(
    'O "$animalName" está a procura de um lar no projeto The Walking Pets! \nhttps://www.thewalkingpets.com.br/adoption/id',
  );
}
