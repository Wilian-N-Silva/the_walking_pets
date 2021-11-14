import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/screens/user/my_pets/add_pet.dart';
import 'package:the_walking_pets/screens/user/user_profile.dart';
import 'package:the_walking_pets/utilities/services/animal_rest_api.dart';
import 'package:the_walking_pets/widgets/animal_grid_tile.dart';

class MyPets extends StatefulWidget {
  const MyPets({Key? key, required this.postInsert}) : super(key: key);
  final bool postInsert;

  @override
  _MyPetsState createState() => _MyPetsState();
}

class _MyPetsState extends State<MyPets> {
  bool? isLoading;
  List _pets = [];

  @override
  void initState() {
    super.initState();
    _getPetList();
  }

  _getPetList() {
    isLoading = true;

    AnimalAPI.getPetsByUser().then((response) {
      var body = json.decode(response.body);

      setState(() {
        _pets = body['animal'] != null
            ? body['animal']
                .map<Animal>((json) => Animal.fromJson(json))
                .toList()
            : [];

        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pets'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const UserProfile()));
          },
        ),
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: isLoading!
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _pets.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não há Pets cadastrados'),
                      ElevatedButton(
                        child: const Text('Adicionar Pet'),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddPet(),
                          ),
                        ),
                      )
                    ],
                  )
                : GridView.count(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(16.0),
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    children: _pets.map<Widget>((animal) {
                      return animalGridTile(context, animal);
                    }).toList(),
                  ),
      ),
    );
  }
}
