import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/model/util/address.dart';
import 'package:the_walking_pets/screens/user/my_locals/my_locals.dart';
import 'package:the_walking_pets/screens/user/my_pets/my_pets.dart';
import 'package:the_walking_pets/utilities/ui/fa5_pet_icons.dart';
import 'package:the_walking_pets/utilities/ui/network_image_handler.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class AddLost extends StatefulWidget {
  const AddLost({Key? key}) : super(key: key);

  @override
  _AddLostState createState() => _AddLostState();
}

class _AddLostState extends State<AddLost> {
  Animal? choosenAnimal;
  Address? choosenAddress;
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  _insert() {
    // DonationAPI.insertAdoption(
    //   animalId: choosenAnimal!.id!,
    //   partnerId: currentUser.id,
    //   addressId: choosenAddress!.id!,
    //   observations: _observationController.text == ''
    //       ? _observationController.text
    //       : null,
    // ).then((response) {
    //   var body = json.decode(response.body);

    //   setState(() {
    //     if (response.statusCode == 200) {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const MyDonations(),
    //         ),
    //       );
    //     } else {
    //       SnackBar snackBar = SnackBar(
    //         content: Text('Erro: ${body['error'].toString()}'),
    //       );

    //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(choosenAnimal == null
            ? 'Selecione o Pet'
            : choosenAnimal!.name.toString()),
        actions: [
          TextButton(
            child: const Text(
              'Publicar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => _insert(),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Visibility(
              visible: choosenAnimal == null,
              child: Column(
                children: const [
                  Center(
                    child: Text('Selecione o pet que deseja encontrar'),
                  ),
                  SizedBox(
                    height: 16.0,
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                height: 150.0,
                width: 150.0,
                margin: const EdgeInsets.only(bottom: 16.0),
                child: choosenAnimal == null
                    ? Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        ),
                        type: MaterialType.transparency,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          splashColor:
                              Theme.of(context).primaryColor.withAlpha(75),
                          highlightColor: Colors.transparent,
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).primaryColor,
                          ),
                          onTap: () async {
                            choosenAnimal = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyPets(
                                  donation: true,
                                ),
                              ),
                            );
                            if (choosenAnimal != null) {
                              setState(() {
                                _petNameController.text =
                                    choosenAnimal!.name.toString();
                              });
                            }
                          },
                        ),
                      )
                    : Material(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Hero(
                          transitionOnUserGestures: false,
                          tag: choosenAnimal!,
                          child: choosenAnimal!.photo!.isNotEmpty
                              ? NetworkImageHandler(
                                  animal: choosenAnimal!,
                                )
                              : Container(
                                  color: Theme.of(context).primaryColor,
                                  child: Icon(
                                    choosenAnimal!.specie == 1
                                        ? FA5Pets.dog
                                        : FA5Pets.cat,
                                    size: 64.0,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
              ),
            ),
            Visibility(
              visible: choosenAnimal != null,
              child: Form(
                child: Column(
                  children: [
                    CustomFormField(
                      label: 'Última localização conhecida',
                      isReadOnly: true,
                      controller: _addressController,
                      onTap: () async {
                        choosenAddress = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyLocals(
                              donation: true,
                            ),
                          ),
                        );

                        setState(() {
                          _addressController.text = choosenAddress != null
                              ? '${choosenAddress!.address}, ${choosenAddress!.number}, ${choosenAddress!.neighborhood}, ${choosenAddress!.location} - ${choosenAddress!.state}'
                              : '';
                        });
                      },
                    ),
                    CustomFormField(
                      label: 'Detalhes do ocorrido',
                      minlines: 5,
                      maxlines: 5,
                      controller: _detailController,
                      action: TextInputAction.newline,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
