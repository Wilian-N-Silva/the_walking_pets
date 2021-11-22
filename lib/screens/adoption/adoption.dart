import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/adoption.dart';
import 'package:the_walking_pets/screens/adoption/adoption_filter.dart';
import 'package:the_walking_pets/utilities/services/adoption_rest_api.dart';
import 'package:the_walking_pets/utilities/ui/curve_clipper.dart';
import 'package:the_walking_pets/widgets/animal_grid_tile.dart';
import 'package:the_walking_pets/widgets/custom_drawer.dart';

class Adoption extends StatefulWidget {
  const Adoption({Key? key}) : super(key: key);

  @override
  _AdoptionState createState() => _AdoptionState();
}

class _AdoptionState extends State<Adoption> {
  bool isLoading = false;
  bool requestError = false;
  List<AdoptionClass> _pets = [];

  @override
  void initState() {
    super.initState();
    _getDonationList();
  }

  _getDonationList() {
    isLoading = true;

    AdoptionAPI.getAdoptionList().then((response) {
      var body = json.decode(response.body);

      setState(() {
        isLoading = false;
        if (response.statusCode == 200) {
          _pets = body['adoption'] != null
              ? body['adoption']
                  .map<AdoptionClass>((json) => AdoptionClass.fromMap(json))
                  .toList()
              : [];
        } else {
          requestError = true;
          SnackBar snackBar = SnackBar(
            content: Text('Erro: ${body['error'].toString()}'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    });
  }

  _animalGridView() {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : _pets.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(requestError
                      ? 'Erro ao listar animais cadastrados'
                      : 'Não há Pets cadastrados'),
                  if (!requestError)
                    ElevatedButton(
                      child: const Text('Adicionar Pet'),
                      onPressed: () {},
                    )
                  else
                    ElevatedButton(
                        child: const Text('Voltar'),
                        onPressed: () => Navigator.pop)
                ],
              )
            : Container(
                margin: EdgeInsets.only(
                  top: (MediaQuery.of(context).size.height / 8),
                ),
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(16.0),
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  children: _pets.map<Widget>(
                    (donation) {
                      return animalGridTile(
                        context: context,
                        animal: donation.animal!,
                        isAdoption: false,
                        adoption: donation,
                      );
                    },
                  ).toList(),
                ),
              );
  }

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
            customAppBar(context, _animalGridView),
          ],
        ),
      ),
    );
  }
}

Widget customAppBar(
  BuildContext context,
  Function() content, {
  Function()? centerButton,
}) {
  return Stack(
    children: [
      content(),
      // BOTTOM CLIPPATH
      ClipPath(
        clipper: CurveClipper(),
        child: Container(
          height: MediaQuery.of(context).size.height / 7,
          color: Colors.lightBlueAccent.shade700,
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
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
          ),
        ),
      ),
    ],
  );
}
