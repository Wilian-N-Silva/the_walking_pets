import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:image/image.dart' as img;

class NetworkImageHandler extends StatefulWidget {
  const NetworkImageHandler({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  NetworkImageHandlerState createState() => NetworkImageHandlerState();
}

class NetworkImageHandlerState extends State<NetworkImageHandler> {
  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;
    return CachedNetworkImage(
      imageUrl: animal.photo!,
      fit: BoxFit.cover,
      placeholder: (context, url) => animal.photoBlurhash!.isNotEmpty
          ? Image.memory(
              Uint8List.fromList(
                img.encodeJpg(
                  BlurHash.decode(animal.photoBlurhash!).toImage(150, 150),
                ),
              ),
              fit: BoxFit.cover,
            )
          : const Icon(Icons.photo),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
