import 'package:flutter/material.dart';

class AddLocal extends StatefulWidget {
  const AddLocal({Key? key}) : super(key: key);

  @override
  _AddLocalState createState() => _AddLocalState();
}

class _AddLocalState extends State<AddLocal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Local'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Salvar',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
