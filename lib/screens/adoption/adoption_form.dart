import 'package:flutter/material.dart';
import 'package:the_walking_pets/constants/adoption_consts.dart';
import 'package:the_walking_pets/model/animal/adoption.dart';
import 'package:the_walking_pets/model/animal/enrollment.dart';
import 'package:the_walking_pets/screens/user/my_adoptions/adoption_list.dart';
import 'package:the_walking_pets/utilities/helpers/fakedata/user_data.dart';
import 'package:the_walking_pets/utilities/services/adoption_rest_api.dart';

import 'package:the_walking_pets/widgets/custom_dropdown_form_field.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({
    Key? key,
    required this.adoption,
  }) : super(key: key);

  final AdoptionClass adoption;

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

      Enrollment enrollment = Enrollment(
        uid: currentUser.id,
        adoptionId: widget.adoption.id!,
        alreadyAdopted: _alreadyAdopted == 'Sim',
        haveChild: _haveChildrens == 'Sim',
        houseOwnership: _houseOwnership == 'Sim',
        numResidents: int.parse(_numberOfResidents.text),
        houseTypeId: AdoptionConsts()
                .houseType
                .indexWhere((value) => value == _houseType) +
            1,
        jobCategoryId: AdoptionConsts()
                .jobCategories
                .indexWhere((value) => value == _jobCategory) +
            1,
        onTravelId: AdoptionConsts()
                .onTravel
                .indexWhere((value) => value == _onTravel) +
            1,
      );

      AdoptionAPI.insertEnrollment(enrollment).then((response) {
        if (response.statusCode == 200) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AdoptionList(),
            ),
          );
        } else {
          setState(() {
            _isLoading = false;
          });

          const snackBar = SnackBar(
            content: Text('Erro ao salvar dados'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Triagem'),
        centerTitle: true,
        actions: [
          Visibility(
            visible: !_isLoading,
            child: TextButton(
              child: const Text(
                'Salvar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => _saveData(),
            ),
          )
        ],
      ),
      body: _isLoading
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Enviando formulário!',
                    style: TextStyle(fontSize: 24.0),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
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
                      label: 'Tem filhos?',
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
                      label: 'É proprietário da casa onde mora?',
                      selected: _houseOwnership,
                      items: const <String>['Sim', 'Não'],
                      handler: _handleHouseType,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
