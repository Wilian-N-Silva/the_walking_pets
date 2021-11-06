import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_walking_pets/data/user_data.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/utilities/age_helpers.dart';
import 'package:the_walking_pets/utilities/data_formatter.dart';
import 'package:the_walking_pets/widgets/date_picker.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  _AdoptionFormState createState() => _AdoptionFormState();
}

class _AdoptionFormState extends State<AdoptionForm> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userBirthday = TextEditingController();
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPhone = TextEditingController();
  final TextEditingController _userCellphone = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late PageController _pageController;
  int currentIndex = 0;

  _saveUser() {
    if (_formKey.currentState!.validate()) {
      print("Name ${_userName.text}");
    }
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    _userName.text = currentUser.nome;
    _userEmail.text = currentUser.email;
    _userBirthday.text =
        DateFormat('dd/MM/yyyy').format(currentUser.dtNasc!).toString();
    _userPhone.text = DataFormatters()
        .brazilianPhoneMask
        .maskText(currentUser.telefone.toString());
    _userCellphone.text = DataFormatters()
        .brazilianCellphoneMask
        .maskText(currentUser.celular.toString());
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animal animal = widget.animal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Triagem'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const Text(
                      'Dados do Adotante',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomFormField(
                      label: 'Nome completo',
                      controller: _userName,
                    ),
                    CustomFormField(
                      label: 'Data de Nascimento',
                      isReadOnly: true,
                      controller: _userBirthday,
                      onTap: () async {
                        _userBirthday.text = await selectDate(
                          context,
                          _userBirthday.text,
                        );
                      },
                    ),
                    CustomFormField(
                      label: 'E-mail',
                      isReadOnly: true,
                      controller: _userEmail,
                    ),
                    CustomFormField(
                      label: 'Telefone Fixo',
                      isReadOnly: false,
                      inputType: TextInputType.number,
                      controller: _userPhone,
                      formatterList: [DataFormatters().brazilianPhoneMask],
                    ),
                    CustomFormField(
                      label: 'Telefone Celular',
                      isReadOnly: false,
                      inputType: TextInputType.number,
                      controller: _userCellphone,
                      formatterList: [DataFormatters().brazilianCellphoneMask],
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const Text(
                      'Dados do Animal',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    CustomFormField(
                      label: 'Nome',
                      value: animal.nome ?? 'Sem nome',
                      isReadOnly: true,
                    ),
                    CustomFormField(
                      label: 'Espécie',
                      value: animal.especie,
                      isReadOnly: true,
                    ),
                    CustomFormField(
                      label: 'Sexo',
                      value: animal.sexo,
                      isReadOnly: true,
                    ),
                    CustomFormField(
                      label: 'Porte',
                      value: animal.porte,
                      isReadOnly: true,
                    ),
                    CustomFormField(
                      label: 'Idade',
                      value: animal.idade != null
                          ? ageFormatter(animal.idade!)
                          : 'Sem informações',
                      isReadOnly: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Form(
      //     key: _formKey,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         Center(
      //           child: ClipOval(
      //             child: Image.asset(
      //               animal.foto,
      //               height: 150.0,
      //               width: 150.0,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         const Padding(
      //           padding: EdgeInsets.symmetric(vertical: 16.0),
      //           child: Text(
      //             'Dados do Adotante',
      //             style: TextStyle(fontSize: 20.0),
      //           ),
      //         ),
      //         customFormField(
      //           label: 'Nome completo',
      //           controller: _userName,
      //         ),
      //         customFormField(
      //           label: 'Data de Nascimento',
      //           isReadOnly: true,
      //           controller: _userBirthday,
      //           onTap: () async {
      //             _userBirthday.text = await selectDate(
      //               context,
      //               _userBirthday.text,
      //             );
      //           },
      //         ),
      //         customFormField(
      //           label: 'E-mail',
      //           isReadOnly: true,
      //           controller: _userEmail,
      //         ),
      //         customFormField(
      //           label: 'Telefone Fixo',
      //           isReadOnly: false,
      //           inputType: TextInputType.number,
      //           controller: _userPhone,
      //           formatterList: [DataFormatters().brazilianPhoneMask],
      //         ),
      //         customFormField(
      //           label: 'Telefone Celular',
      //           isReadOnly: false,
      //           inputType: TextInputType.number,
      //           controller: _userCellphone,
      //           formatterList: [DataFormatters().brazilianCellphoneMask],
      //         ),
      //         const Padding(
      //           padding: EdgeInsets.symmetric(vertical: 16.0),
      //           child: Text(
      //             'Dados do Animal',
      //             style: TextStyle(fontSize: 20.0),
      //           ),
      //         ),
      //         customFormField(
      //           label: 'Nome',
      //           value: animal.nome ?? 'Sem nome',
      //           isReadOnly: false,
      //         ),
      //         customFormField(label: 'Espécie', value: animal.especie),
      //         customFormField(label: 'Sexo', value: animal.sexo),
      //         customFormField(label: 'Porte', value: animal.porte),
      //         customFormField(
      //           label: 'Idade',
      //           value: animal.idade != null
      //               ? ageFormatter(animal.idade!)
      //               : 'Sem informações',
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
