import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/widgets/animal_profile_info_tile.dart';
import 'package:the_walking_pets/utilities/helpers/animal_profile_share.dart';

class AnimalProfileTile {
  AnimalProfileTile({
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  final String title;
  final String subtitle;
  final IconData leading;
}

class AnimalProfile extends StatefulWidget {
  const AnimalProfile({Key? key}) : super(key: key);

  @override
  _AnimalProfileState createState() => _AnimalProfileState();
}

class _AnimalProfileState extends State<AnimalProfile> {
  @override
  Widget build(BuildContext context) {
    final List<AnimalProfileTile> animalProfileTileDatasource = [
      AnimalProfileTile(
        title: 'Localização',
        subtitle: 'São Paulo - SP',
        leading: Icons.location_on,
      ),
      AnimalProfileTile(
        title: 'Espécie',
        subtitle: 'info',
        leading: Icons.local_offer,
      ),

      // AnimalProfileTile(
      //   title: 'Idade',
      //   subtitle: animal.idade != null
      //       ? ageFormatter(animal.idade!)
      //       : 'Sem informações',
      //   leading: Icons.cake,
      // ),
      AnimalProfileTile(
        title: 'Temperamento',
        subtitle: 'info',
        leading: Icons.mood,
      ),
      AnimalProfileTile(
        title: 'Castrado',
        subtitle: 'info',
        leading: Icons.local_hospital,
      ),
      AnimalProfileTile(
        title: 'Vacinado',
        subtitle: 'info',
        leading: Icons.health_and_safety,
      ),
      AnimalProfileTile(
        title: 'Sexo',
        subtitle: 'info',
        leading: Icons.help,
      ),
      AnimalProfileTile(
        title: 'Porte',
        subtitle: 'info',
        leading: Icons.swap_horiz_outlined,
      ),

      AnimalProfileTile(
        title: 'Pelagem',
        subtitle: 'info',
        leading: Icons.color_lens_outlined,
      ),
    ];

    int screenHeight = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'info',
        ),
        backgroundColor: Colors.black38,
        actions: [
          IconButton(
            onPressed: () async {
              shareAnimalProfile(
                context,
                'info',
              );
            },
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Stack(
            children: [
              SizedBox(
                height: screenHeight / 2,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ViewImage(
                    //       path: animal.foto.toString(),
                    //     ),
                    //   ),
                    // );
                  },
                  // child: Hero(
                  //   tag: animal,
                  //   child: Image.asset(
                  //     animal.foto.toString(),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: (screenHeight / 2) - 25),
                height: 50.0,
                child: Center(
                  child: TextButton(
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
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AdoptionForm(
                      //       animal: animal,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: (screenHeight / 2) + 25),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: animalProfileTileDatasource.length,
              itemBuilder: (BuildContext context, int index) {
                return animalProfileInfoTile(
                    animalProfileTileDatasource[index].title,
                    animalProfileTileDatasource[index].subtitle,
                    animalProfileTileDatasource[index].leading);
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

String formatWeight(double weight) {
  return weight.toStringAsFixed(weight.truncateToDouble() == weight ? 0 : 1);
}
