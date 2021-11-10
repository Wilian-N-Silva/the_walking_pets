import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/screens/adoption/adopt_form.dart';
import 'package:the_walking_pets/utilities/helpers/age_helpers.dart';
import 'package:the_walking_pets/widgets/animal_profile_info_tile.dart';
import 'package:the_walking_pets/utilities/helpers/animal_profile_share.dart';
import 'package:the_walking_pets/widgets/view_image.dart';

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
  const AnimalProfile({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  _AnimalProfileState createState() => _AnimalProfileState();
}

class _AnimalProfileState extends State<AnimalProfile> {
  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;

    final List<AnimalProfileTile> animalProfileTileDatasource = [
      AnimalProfileTile(
        title: 'Localização',
        subtitle: 'São Paulo - SP',
        leading: Icons.location_on,
      ),
      AnimalProfileTile(
        title: 'Espécie',
        subtitle: animal.especie ?? 'Sem Informações',
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
        subtitle: animal.temperamento ?? 'Sem informações',
        leading: Icons.mood,
      ),
      AnimalProfileTile(
        title: 'Castrado',
        subtitle: animal.castrado != null
            ? (animal.castrado! ? 'Sim' : 'Não')
            : 'Sem informações',
        leading: Icons.local_hospital,
      ),
      AnimalProfileTile(
        title: 'Vacinado',
        subtitle: animal.vacinado != null
            ? (animal.vacinado! ? 'Sim' : 'Não')
            : 'Sem informações',
        leading: Icons.health_and_safety,
      ),
      AnimalProfileTile(
        title: 'Sexo',
        subtitle: animal.sexo ?? 'Sem Informações',
        leading: animal.sexo != null
            ? animal.sexo.toString().toLowerCase() == 'macho'
                ? Icons.male
                : Icons.female
            : Icons.help,
      ),
      AnimalProfileTile(
        title: 'Porte',
        subtitle: animal.porte ?? 'Sem Informações',
        leading: Icons.swap_horiz_outlined,
      ),

      AnimalProfileTile(
        title: 'Pelagem',
        subtitle: animal.pelagem ?? 'Sem informações',
        leading: Icons.color_lens_outlined,
      ),
    ];

    int screenHeight = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          animal.nome ?? 'Sem nome',
        ),
        backgroundColor: Colors.black38,
        actions: [
          IconButton(
            onPressed: () async {
              shareAnimalProfile(context, animal.nome.toString());
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewImage(
                          path: animal.foto.toString(),
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: animal,
                    child: Image.asset(
                      animal.foto.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdoptionForm(
                            animal: animal,
                          ),
                        ),
                      );
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
