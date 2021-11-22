import 'package:flutter/material.dart';
import 'package:the_walking_pets/constants/adoption_consts.dart';
import 'package:the_walking_pets/model/animal/animal.dart';

import 'package:the_walking_pets/widgets/custom_dropdown_form_field.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({
    Key? key,
    required this.animal,
  }) : super(key: key);

  final Animal animal;

  @override
  _AdoptionFormState createState() => _AdoptionFormState();
}

class _AdoptionFormState extends State<AdoptionForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _numberOfResidents = TextEditingController();

  bool _isLoading = false;

  String? _jobCategory,
      _haveChildrens,
      _onTravel,
      _alreadyAdopted,
      _houseType,
      _houseOwnership;

  _handleJobCategory(String? value) {
    _jobCategory = value;
  }

  _handleOnTravel(String? value) {
    _onTravel = value;
  }

  _handleChildrens(String? value) {
    _haveChildrens = value;
  }

  _handleAlreadyAdopted(String? value) {
    _alreadyAdopted = value;
  }

  _handleHouseOwnership(String? value) {
    _houseOwnership = value;
  }

  _handleHouseType(String? value) {
    _houseType = value;
  }

  _saveData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      /*
      adoptionId:
      uid:
numResidentes:
jobCategory:
haveChild
alreadyAdopted
onTravel
houseType
houseOwnership

      */

/*
       uid: currentUser.id,
        photo: _photoUrl,
        photoBlurhash: _blurhash,
        name: _petName.text,
        color: _petColor.text,
        microchip: _petMicrochip.text,
        isCastrated: _isCastrated,
        isVacinated: _isVacinated,
        birth: DateFormat('dd/MM/yyyy').parse(_petBirthday.text),
        castrationDate: _isCastrated
            ? DateFormat('dd/MM/yyyy').parse(_petCastratedDate.text)
            : null,
        specie:
            AnimalConsts.species.indexWhere((value) => value == _petSpecie) + 1,
        gender:
            AnimalConsts.gender.indexWhere((value) => value == _petGender) + 1,
        size: AnimalConsts.size.indexWhere((value) => value == _petSize) + 1,
    */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Triagem'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                label: 'Quantas pessoas moram com você?',
                inputType: TextInputType.number,
                controller: _numberOfResidents,
              ),
              CustomDropdown(
                label: 'Área de atuação profissional',
                selected: _jobCategory,
                items: AdoptionConsts().jobCategories,
                handler: _handleJobCategory,
              ),
              CustomDropdown(
                label: 'Tem filhos',
                selected: _haveChildrens,
                items: const <String>['Sim', 'Não'],
                handler: _handleChildrens,
              ),
              CustomDropdown(
                label: 'Já adotou algum animal?',
                selected: _alreadyAdopted,
                items: const <String>['Sim', 'Não'],
                handler: _handleAlreadyAdopted,
              ),
              CustomDropdown(
                label: 'Durante viagens, onde deixará o animal?',
                selected: _onTravel,
                items: AdoptionConsts().onTravel,
                handler: _handleOnTravel,
              ),
              CustomDropdown(
                label: 'Mora em casa ou apartamento?',
                selected: _houseType,
                items: AdoptionConsts().houseType,
                handler: _handleHouseOwnership,
              ),
              CustomDropdown(
                label: 'Mora de aluguel ou imóvel próprio?',
                selected: _houseOwnership,
                items: AdoptionConsts().houseOwnership,
                handler: _handleHouseType,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
