import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:the_walking_pets/constants/animal_consts.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/screens/user/my_pets/my_pets.dart';
import 'package:the_walking_pets/utilities/helpers/fakedata/user_data.dart';
import 'package:the_walking_pets/utilities/helpers/generate_blurhash.dart';
import 'package:the_walking_pets/utilities/services/animal_rest_api.dart';
import 'package:the_walking_pets/utilities/ui/fa5_pet_icons.dart';
import 'package:the_walking_pets/widgets/custom_dropdown_form_field.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';
import 'package:the_walking_pets/widgets/date_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddPet extends StatefulWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  _AddPetState createState() => _AddPetState();
}

class _AddPetState extends State<AddPet> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _petColor = TextEditingController();
  final TextEditingController _petMicrochip = TextEditingController();
  final TextEditingController _petName = TextEditingController();
  final TextEditingController _petBirthday = TextEditingController();
  final TextEditingController _petCastratedDate = TextEditingController();

  String? _petSpecie,
      _petGender,
      _petSize,
      _petTemperament,
      _catCoat,
      _dogCoat,
      _photoUrl,
      _blurhash;

  bool _isCastrated = false, _isVacinated = false, _isLoading = false;

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
              ? _petSpecie == null
                  ? const Icon(
                      Icons.add_a_photo,
                      size: 64.0,
                      color: Colors.white,
                    )
                  : Icon(
                      _petSpecie == AnimalConsts.species[0]
                          ? FA5Pets.dog
                          : FA5Pets.cat,
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

  _handleCatCoat(String? value) {
    _catCoat = value;
  }

  _handleDogCoat(String? value) {
    _dogCoat = value;
  }

  _handleSpecie(String? value) {
    setState(() {
      _petSpecie = value;
    });
  }

  _handleGender(String? value) {
    _petGender = value;
  }

  _saveData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      if (_imageFileList != null) {
        _photoUrl = _photoUrl ?? await uploadPhoto();
        _blurhash = await generateBlurhash(_imageFileList![0].path);
      }

      Animal animalFormData = Animal(
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
        temperament: AnimalConsts.temperament
                .indexWhere((value) => value == _petTemperament) +
            1,
        coat: AnimalConsts.coats.indexWhere((element) =>
                element == (_petSpecie == 'Cachorro' ? _dogCoat : _catCoat)) +
            1,
      );

      AnimalAPI.insertPet(animalFormData).then((response) {
        setState(() {
          _isLoading = false;
        });

        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyPets(
                donation: false,
              ),
            ),
          );
        } else {
          const snackBar = SnackBar(
            content: Text('Erro ao salvar dados'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    }
  }

  Future<String> uploadPhoto() async {
    await Firebase.initializeApp();
    var task = await firebase_storage.FirebaseStorage.instance
        .ref()
        .child(DateTime.now().millisecondsSinceEpoch.toString())
        .putFile(File(_imageFileList![0].path));

    return await task.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Pet'),
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
                    'Inserindo novo pet!',
                    style: TextStyle(fontSize: 24.0),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _petPhoto(),
                    const SizedBox(height: 16.0),
                    CustomFormField(
                      label: 'Nome',
                      controller: _petName,
                    ),
                    CustomDropdown(
                      label: 'Espécie',
                      selected: _petSpecie,
                      items: AnimalConsts.species,
                      handler: _handleSpecie,
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
                    Visibility(
                      visible: _petSpecie == AnimalConsts.species[0],
                      child: CustomDropdown(
                        label: 'Pelagem',
                        selected: _dogCoat,
                        items: AnimalConsts.dogCoat,
                        handler: _handleDogCoat,
                      ),
                    ),
                    Visibility(
                      visible: _petSpecie == AnimalConsts.species[1],
                      child: CustomDropdown(
                        label: 'Pelagem',
                        selected: _catCoat,
                        items: AnimalConsts.catCoat,
                        handler: _handleCatCoat,
                      ),
                    ),
                    CustomFormField(
                      label: 'Cor',
                      isRequired: true,
                      controller: _petColor,
                    ),
                    CustomFormField(
                      label: 'Data de Nascimento Aproximada',
                      isReadOnly: true,
                      controller: _petBirthday,
                      onTap: () async {
                        _petBirthday.text = await selectDate(
                          context,
                          DateFormat('dd/MM/yyyy')
                              .format(DateTime.now())
                              .toString(),
                        );
                      },
                    ),
                    CustomFormField(
                      label: 'Código do Microchip',
                      isRequired: false,
                      useOptionalLabel: true,
                      controller: _petMicrochip,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Castrado',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Switch(
                          value: _isCastrated,
                          onChanged: (bool value) {
                            setState(() {
                              _isCastrated = value;
                              _petCastratedDate.text =
                                  !_isCastrated ? '' : _petCastratedDate.text;
                            });
                          },
                        )
                      ],
                    ),
                    if (_isCastrated)
                      CustomFormField(
                        label: 'Data da castração',
                        isReadOnly: true,
                        controller: _petCastratedDate,
                        onTap: () async {
                          _petCastratedDate.text = await selectDate(
                            context,
                            DateFormat('dd/MM/yyyy')
                                .format(DateTime.now())
                                .toString(),
                          );
                        },
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Vacinado',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Switch(
                          value: _isVacinated,
                          onChanged: (bool value) {
                            setState(() {
                              _isVacinated = value;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
