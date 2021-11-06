import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_walking_pets/utilities/consts/animal_consts.dart';
import 'package:the_walking_pets/widgets/custom_dropdown_form_field.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class AddPet extends StatefulWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  String? petSpecie;
  String? petGender;
  String? petSize;
  String? petTemperament;
  String? petCoat;

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

        // log(base64Encode(File(pickedFile!.path).readAsBytesSync()));
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
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
        });
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
          _showPicker(context);
        },
      ),
    );
  }

  _handleSize(String? value) {
    petSize = value;
  }

  _handleTemperament(String? value) {
    petTemperament = value;
  }

  _handleCoat(String? value) {
    petCoat = value;
  }

  _handleSpecie(String? value) {
    petSpecie = value!;
  }

  _handleGender(String? value) {
    petGender = value!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Pet'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Salvar',
              style: TextStyle(color: Colors.white),
            ),
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
            const CustomFormField(
              label: 'Nome',
              isOptional: false,
            ),
            CustomDropdown(
              label: 'Espécie',
              selected: petSpecie,
              items: AnimalConsts.species,
              handler: _handleSpecie,
              isOptional: false,
            ),
            CustomDropdown(
              label: 'Sexo',
              selected: petGender,
              items: AnimalConsts.gender,
              handler: _handleGender,
            ),
            CustomDropdown(
              label: 'Porte',
              selected: petSize,
              items: AnimalConsts.size,
              handler: _handleSize,
            ),
            CustomDropdown(
              label: 'Temperamento',
              selected: petTemperament,
              items: AnimalConsts.temperament,
              handler: _handleTemperament,
            ),
            CustomDropdown(
              label: 'Pelagem',
              selected: petCoat,
              items: AnimalConsts.coat,
              handler: _handleCoat,
            ),
            const CustomFormField(label: 'Cor', isOptional: true),
            const CustomFormField(
              label: 'Código do Microchip',
            ),
          ],
        ),
      ),
    );
  }
}
