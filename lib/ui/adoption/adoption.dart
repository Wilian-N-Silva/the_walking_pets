import 'package:flutter/material.dart';
import 'package:the_walking_pets/data/animal_data.dart';
import 'package:the_walking_pets/ui/adoption/adoption_filter.dart';
import 'package:the_walking_pets/widgets/animal_grid_tile.dart';
import 'package:the_walking_pets/util/curve_clipper.dart';
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
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            // BOTTOM CLIPPATH
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 7,
                color: Colors.lightBlueAccent.shade700,
              ),
            ),

            // GRID ANIMALS
            Container(
              margin: EdgeInsets.only(
                top: ((MediaQuery.of(context).size.height / 7) - 24),
              ),
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 48,
                ),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: animalData(context).map<Widget>((animal) {
                  return animalTile(context, animal);
                }).toList(),
              ),
            ),

            // TOP CLIPPATH
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: (MediaQuery.of(context).size.height / 7) - 16.0,
                width: double.infinity,
                color: Colors.lightBlueAccent.shade400,
              ),
            ),

            // FILTER BUTTON CONTAINER
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
