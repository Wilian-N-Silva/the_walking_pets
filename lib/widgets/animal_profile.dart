import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/constants/animal_consts.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/utilities/helpers/fakedata/user_data.dart';
import 'package:the_walking_pets/utilities/ui/fa5_pet_icons.dart';
import 'package:the_walking_pets/utilities/ui/network_image_handler.dart';
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
  const AnimalProfile({
    Key? key,
    required this.animal,
  }) : super(key: key);

  final Animal animal;

  @override
  _AnimalProfileState createState() => _AnimalProfileState();
}

class _AnimalProfileState extends State<AnimalProfile> {
  @override
  Widget build(BuildContext context) {
    Animal animal = widget.animal;

    log(animal.toJson());

    final List<AnimalProfileTile> animalProfileTileDatasource = [
      // AnimalProfileTile(
      //   title: 'Localização',
      //   subtitle: 'São Paulo - SP',
      //   leading: Icons.location_on,
      // ),
      AnimalProfileTile(
        title: 'Espécie',
        subtitle: AnimalConsts.species.elementAt(animal.specie! - 1),
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
        subtitle: AnimalConsts.temperament.elementAt(animal.temperament! - 1),
        leading: Icons.mood,
      ),
      AnimalProfileTile(
        title: 'Castrado',
        subtitle: animal.isCastrated != null
            ? animal.isCastrated!
                ? 'Sim'
                : 'Não'
            : 'Sem informações',
        leading: Icons.local_hospital,
      ),
      AnimalProfileTile(
        title: 'Vacinado',
        subtitle: animal.isVacinated != null
            ? animal.isVacinated!
                ? 'Sim'
                : 'Não'
            : 'Sem informações',
        leading: Icons.health_and_safety,
      ),
      AnimalProfileTile(
        title: 'Sexo',
        subtitle: AnimalConsts.gender.elementAt(animal.gender! - 1),
        leading:
            AnimalConsts.gender.elementAt(animal.gender! - 1).toLowerCase() ==
                    'macho'
                ? Icons.male
                : Icons.female,
      ),
      AnimalProfileTile(
        title: 'Porte',
        subtitle: AnimalConsts.size.elementAt(animal.size! - 1),
        leading: Icons.swap_horiz_outlined,
      ),

      AnimalProfileTile(
        title: 'Pelagem',
        subtitle: AnimalConsts.coats.elementAt(animal.coat! - 1),
        leading: Icons.color_lens_outlined,
      ),
    ];

    int screenHeight = MediaQuery.of(context).size.height.toInt();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          animal.name!,
        ),
        backgroundColor: Colors.black38,
        actions: [
          if (animal.uid != currentUser.id)
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
            )
          else
            TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.edit,
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
                          animal: animal,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: animal,
                    child: animal.photo!.isNotEmpty
                        ? NetworkImageHandler(
                            animal: animal,
                          )
                        : Container(
                            color: Theme.of(context).primaryColor,
                            child: Icon(
                              animal.specie == 1 ? FA5Pets.dog : FA5Pets.cat,
                              size: 64.0,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              if (animal.uid != currentUser.id)
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
            margin: EdgeInsets.only(
              top: (screenHeight / 2) + (animal.uid != currentUser.id ? 25 : 0),
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: animalProfileTileDatasource.length,
              itemBuilder: (BuildContext context, int index) {
                return animalProfileInfoTile(
                  animalProfileTileDatasource[index].title,
                  animalProfileTileDatasource[index].subtitle,
                  animalProfileTileDatasource[index].leading,
                );
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
