import 'package:flutter/material.dart';
import 'package:the_walking_pets/screens/user/my_pets/add_pet.dart';

class MyPets extends StatefulWidget {
  const MyPets({Key? key}) : super(key: key);

  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pets'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPet(),
                ),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
