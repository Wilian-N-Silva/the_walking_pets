import 'package:flutter/material.dart';

class ViewImage extends StatefulWidget {
  const ViewImage({Key? key, required this.path}) : super(key: key);

  final String path;
  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    final animal = widget.path;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: InteractiveViewer(
            child: Image.asset(
              animal,
            ),
          ),
        ),
      ),
    );
  }
}
