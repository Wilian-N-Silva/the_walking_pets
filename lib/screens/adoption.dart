import 'package:flutter/material.dart';
import 'package:the_walking_pets/data/animal.dart';
import 'package:the_walking_pets/screens/animal_profile.dart';
import 'package:the_walking_pets/screens/adoption_filter.dart';
import 'package:the_walking_pets/widgets/curve_clipper.dart';
import 'package:the_walking_pets/widgets/custom_drawer.dart';

class Adoption extends StatefulWidget {
  const Adoption({Key? key}) : super(key: key);

  @override
  _AdoptionState createState() => _AdoptionState();
}

class _AdoptionState extends State<Adoption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Encontre seu novo amigo!'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent.shade400,
        foregroundColor: Colors.white,
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: 120,
                color: Colors.lightBlueAccent.shade700,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70.0),
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 50,
                ),
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                children: animalData(context).map<Widget>((animal) {
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
                      footer: Material(
                        color: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(15.0),
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: GridTileBar(
                          backgroundColor: Colors.black45,
                          title: Text(animal.nome.toString()),
                          trailing: Icon(
                            animal.sexo.toString().toLowerCase() == 'macho'
                                ? Icons.male
                                : Icons.female,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Hero(
                          transitionOnUserGestures: false,
                          tag: 'animal',
                          child: Image.asset(
                            animal.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: 105,
                width: double.infinity,
                color: Colors.lightBlueAccent.shade400,
              ),
            ),
            SizedBox(
              height: 50.0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdoptionFilter(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.filter_list_alt),
                      Text('Filtro'),
                    ],
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(128, 48.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
