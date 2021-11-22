import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/adoption.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/utilities/ui/fa5_pet_icons.dart';
import 'package:the_walking_pets/utilities/ui/network_image_handler.dart';
import 'package:the_walking_pets/widgets/animal_profile.dart';

Widget animalGridTile({
  required BuildContext context,
  required Animal animal,
  required bool isAdoption,
  AdoptionClass? adoption,
}) {
  return GestureDetector(
    onTap: () {
      !isAdoption
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnimalProfile(
                  animal: animal,
                  adoption: adoption!,
                ),
              ),
            )
          : Navigator.pop(
              context,
              animal,
            );
    },
    child: GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16.0),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(animal.name ?? 'Sem nome'),
          trailing: Icon(
            animal.gender != null
                ? animal.gender == 1
                    ? Icons.male
                    : Icons.female
                : Icons.help,
            color: Colors.white,
          ),
        ),
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: Hero(
          transitionOnUserGestures: false,
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
  );
}
