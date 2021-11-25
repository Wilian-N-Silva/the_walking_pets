import 'package:flutter/material.dart';
import 'package:the_walking_pets/screens/lost_and_found/add_found.dart';
import 'package:the_walking_pets/screens/lost_and_found/add_lost.dart';
import 'package:the_walking_pets/widgets/custom_drawer.dart';

class MyLostAndFound extends StatefulWidget {
  const MyLostAndFound({Key? key}) : super(key: key);

  @override
  _MyLostAndFoundState createState() => _MyLostAndFoundState();
}

class _MyLostAndFoundState extends State<MyLostAndFound> {
  _optionDialog() {
    return AlertDialog(
      title: const Text(
        'Adicionar',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Perdi um animal'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddLost(),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Encontrei um animal'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddFound(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceAround,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achados e Perdidos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => _optionDialog(),
              );
            },
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: const SingleChildScrollView(),
    );
  }
}
