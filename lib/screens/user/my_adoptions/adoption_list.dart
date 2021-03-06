import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/enrollment.dart';
import 'package:the_walking_pets/screens/user/my_adoptions/adoption_progress.dart';
import 'package:the_walking_pets/utilities/services/user_rest_api.dart';
import 'package:the_walking_pets/utilities/ui/circular_loading.dart';
import 'package:the_walking_pets/utilities/ui/fa5_pet_icons.dart';
import 'package:the_walking_pets/utilities/ui/network_image_handler.dart';

class AdoptionList extends StatefulWidget {
  const AdoptionList({Key? key}) : super(key: key);

  @override
  _AdoptionListState createState() => _AdoptionListState();
}

class _AdoptionListState extends State<AdoptionList> {
  bool isLoading = true;
  bool requestError = false;
  List<Enrollment> _pets = [];

  @override
  void initState() {
    super.initState();
    _getPetList();
  }

  _getPetList() {
    isLoading = true;

    UserAPI.getEnrollmentsByUser().then((response) {
      var body = json.decode(response.body);

      setState(() {
        isLoading = false;
        if (response.statusCode == 200) {
          _pets = body['adoption_enrollment'] != null
              ? body['adoption_enrollment']
                  .map<Enrollment>((json) => Enrollment.fromJson(json))
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas adoções'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: isLoading
            ? const CircularLoading()
            : _pets.isEmpty
                ? Center(
                    child: Text(
                      requestError
                          ? 'Erro ao listar registros de adoção'
                          : 'Não há registros de adoção',
                    ),
                  )
                : GridView.count(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(16.0),
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    children: _pets.map<Widget>(
                      (enroll) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdoptionProgress(
                                  enroll: enroll,
                                ),
                              ),
                            );
                          },
                          child: GridTile(
                            footer: Material(
                              color: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(16.0),
                                ),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: GridTileBar(
                                backgroundColor: Colors.black45,
                                title: Text(enroll.adoption!.animal!.name ??
                                    'Sem nome'),
                                trailing: Icon(
                                  enroll.status! < 3
                                      ? Icons.watch_later_outlined
                                      : enroll.status! == 3
                                          ? Icons.favorite
                                          : Icons.error,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: Material(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Hero(
                                transitionOnUserGestures: false,
                                tag: enroll,
                                child: enroll
                                        .adoption!.animal!.photo!.isNotEmpty
                                    ? NetworkImageHandler(
                                        animal: enroll.adoption!.animal!,
                                      )
                                    : Container(
                                        color: Theme.of(context).primaryColor,
                                        child: Icon(
                                          enroll.adoption!.animal!.specie == 1
                                              ? FA5Pets.dog
                                              : FA5Pets.cat,
                                          size: 64.0,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
      ),
    );
  }
}
