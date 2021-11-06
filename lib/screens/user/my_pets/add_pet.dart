import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_walking_pets/constants/animal_consts.dart';
import 'package:the_walking_pets/widgets/custom_dropdown_form_field.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class AddPet extends StatefulWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  String? _petSpecie, _petGender, _petSize, _petTemperament, _petCoat;

  final TextEditingController _petColor = TextEditingController();
  final TextEditingController _petMicrochip = TextEditingController();
  final TextEditingController _petName = TextEditingController();
  List<XFile>? _imageFileList;

  dynamic _pickImageError;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  final ImagePicker _picker = ImagePicker();

  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
      );
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Widget _petPhoto() {
    return Center(
      child: GestureDetector(
        child: Container(
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: _imageFileList == null
              ? const Icon(
                  Icons.add_a_photo,
                  size: 64.0,
                  color: Colors.white,
                )
              : Stack(
                  children: [
                    ClipOval(
                      child: Image.file(
                        File(_imageFileList![0].path),
                        height: 150.0,
                        width: 150.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 86,
                      child: Container(
                        height: 64.0,
                        width: 64.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.photo,
                          size: 32.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
        ),
        onTap: () {
          imagePickerModal();
        },
      ),
    );
  }

  Future<dynamic> imagePickerModal() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        var snackBar = SnackBar(
          content: Text(_pickImageError.toString()),
        );

        if (_pickImageError != null) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        return SafeArea(
          child: Wrap(
            children: <Widget>[
              const ListTile(
                title: Text('Adicione uma foto de seu pet!'),
              ),
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Escolher da galeria'),
                  onTap: () {
                    _onImageButtonPressed(
                      ImageSource.gallery,
                      context: context,
                    );

                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Usar a Câmera'),
                onTap: () {
                  _onImageButtonPressed(
                    ImageSource.camera,
                    context: context,
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _handleSize(String? value) {
    _petSize = value;
  }

  _handleTemperament(String? value) {
    _petTemperament = value;
  }

  _handleCoat(String? value) {
    _petCoat = value;
  }

  _handleSpecie(String? value) {
    _petSpecie = value;
  }

  _handleGender(String? value) {
    _petGender = value;
  }

  _saveData() {
    // _petSpecie
    // _petGender
    // _petSize
    // _petTemperament
    // _petCoat
    // _petColor.text
    // _petMicrochip.text
    // _petName.text
    // _imageFileList![0].path
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Pet'),
        actions: [
          TextButton(
            child: const Text(
              'Salvar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => _saveData(),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _petPhoto(),
            const SizedBox(height: 16.0),
            CustomFormField(
              label: 'Nome',
              isOptional: false,
              controller: _petName,
            ),
            CustomDropdown(
              label: 'Espécie',
              selected: _petSpecie,
              items: AnimalConsts.species,
              handler: _handleSpecie,
              isOptional: false,
            ),
            CustomDropdown(
              label: 'Sexo',
              selected: _petGender,
              items: AnimalConsts.gender,
              handler: _handleGender,
            ),
            CustomDropdown(
              label: 'Porte',
              selected: _petSize,
              items: AnimalConsts.size,
              handler: _handleSize,
            ),
            CustomDropdown(
              label: 'Temperamento',
              selected: _petTemperament,
              items: AnimalConsts.temperament,
              handler: _handleTemperament,
            ),
            CustomDropdown(
              label: 'Pelagem',
              selected: _petCoat,
              items: AnimalConsts.coat,
              handler: _handleCoat,
            ),
            CustomFormField(
              label: 'Cor',
              isOptional: true,
              controller: _petColor,
            ),
            CustomFormField(
              label: 'Código do Microchip',
              controller: _petMicrochip,
            ),
          ],
        ),
      ),
    );
  }
}
