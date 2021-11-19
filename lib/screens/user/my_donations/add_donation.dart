import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/screens/user/my_donations/donation_list.dart';
import 'package:the_walking_pets/screens/user/my_pets/my_pets.dart';
import 'package:the_walking_pets/utilities/helpers/fakedata/user_data.dart';
import 'package:the_walking_pets/utilities/services/donation_rest_api.dart';
import 'package:the_walking_pets/utilities/ui/fa5_pet_icons.dart';
import 'package:the_walking_pets/utilities/ui/network_image_handler.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class AddDonation extends StatefulWidget {
  const AddDonation({Key? key}) : super(key: key);

  @override
  _AddDonationState createState() => _AddDonationState();
}

class _AddDonationState extends State<AddDonation> {
  Animal? choosenAnimal;
  final TextEditingController _petNameController = TextEditingController();

  _donate() {
    DonationAPI.insertAdoption(
      animalId: choosenAnimal!.id!,
      partnerId: currentUser.id,
    ).then((response) {
      var body = json.decode(response.body);

      setState(() {
        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyDonations(),
            ),
          );
        } else {
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
        actions: [
          TextButton(
            child: const Text(
              'Doar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => _donate(),
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
                    child: Text('Selecione o pet que deseja doar'),
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
                                  adoption: true,
                                ),
                              ),
                            );
                            setState(() {
                              _petNameController.text =
                                  choosenAnimal!.name.toString();
                            });
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
                      label: 'Nome',
                      controller: _petNameController,
                      isReadOnly: true,
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
