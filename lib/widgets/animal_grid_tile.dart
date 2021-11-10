import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/widgets/animal_profile.dart';

Widget animalTile(BuildContext context, Animal animal) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnimalProfile(animal: animal),
        ),
      );
    },
    child: GridTile(
      header: animal.perdido || animal.achado
          ? Material(
              color: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(
                  animal.perdido ? 'Perdido' : 'Encontrado',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : null,
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
          title: Text(animal.nome ?? 'Sem nome'),
          trailing: Icon(
            animal.sexo != null
                ? animal.sexo.toString().toLowerCase() == 'macho'
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
          child: Image.asset(
            animal.foto!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
