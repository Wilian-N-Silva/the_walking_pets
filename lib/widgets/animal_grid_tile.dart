import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:the_walking_pets/model/animal/animal.dart';

Widget animalGridTile(BuildContext context, Animal animal) {
  // print(animal.photoBlurhash!.isEmpty);

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
              ? CachedNetworkImage(
                  imageUrl: animal.photo!,
                  height: 150.0,
                  width: 150.0,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      animal.photoBlurhash!.isNotEmpty
                          ? Image.memory(
                              Uint8List.fromList(
                                img.encodeJpg(
                                  BlurHash.decode(animal.photoBlurhash!)
                                      .toImage(150, 150),
                                ),
                              ),
                              fit: BoxFit.cover,
                            )
                          : const Icon(Icons.photo),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Container(
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.no_photography,
                    size: 64.0,
                  ),
                ),
        ),
      ),
    ),
  );
}
