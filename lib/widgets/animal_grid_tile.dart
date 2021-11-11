import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal_api.dart';

Widget animalGridTile(BuildContext context, AnimalClass animal) {
  return GestureDetector(
    onTap: () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => AnimalProfile(animal: animal),
      //   ),
      // );
    },
    child: GridTile(
      // header: animal.perdido || animal.achado
      //     ? Material(
      //         color: Colors.transparent,
      //         shape: const RoundedRectangleBorder(
      //           borderRadius: BorderRadius.vertical(
      //             top: Radius.circular(16.0),
      //           ),
      //         ),
      //         clipBehavior: Clip.antiAlias,
      //         child: GridTileBar(
      //           backgroundColor: Colors.black45,
      //           title: Text(
      //             animal.perdido ? 'Perdido' : 'Encontrado',
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       )
      //     : null,
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
          child: Image.network(
            animal.photo!,
            height: 150.0,
            width: 150.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
