import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/utilities/ui/network_image_handler.dart';

class ViewImage extends StatefulWidget {
  const ViewImage({Key? key, required this.animal}) : super(key: key);

  final Animal animal;
  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: InteractiveViewer(
            child: NetworkImageHandler(
              animal: animal,
            ),
          ),
        ),
      ),
    );
  }
}
