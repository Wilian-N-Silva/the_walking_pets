import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_walking_pets/data/user_data.dart';
import 'package:the_walking_pets/utilities/data_formatter.dart';
import 'package:the_walking_pets/widgets/date_picker.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class MyData extends StatefulWidget {
  const MyData({Key? key}) : super(key: key);

  @override
  _MyDataState createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _birthDay = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _cellphone = TextEditingController();

  _saveData() {
    print(_name.text);
    print(_email.text);
    print(DateFormat('dd/MM/yyyy').parse(_birthDay.text));
    print(_phone.text);
    print(_cellphone.text);
  }

  @override
  void initState() {
    super.initState();
    _name.text = currentUser.nome;
    _email.text = currentUser.email;
    _birthDay.text =
        DateFormat('dd/MM/yyyy').format(currentUser.dtNasc!).toString();
    _phone.text = DataFormatters().brazilianPhoneMask.maskText(
          currentUser.telefone.toString(),
        );
    _cellphone.text = DataFormatters().brazilianCellphoneMask.maskText(
          currentUser.celular.toString(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Dados'),
        actions: [
          TextButton(
            child: const Text(
              'Salvar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              _saveData();
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomFormField(
                label: 'Nome completo',
                controller: _name,
              ),
              CustomFormField(
                label: 'Data de Nascimento',
                isReadOnly: true,
                controller: _birthDay,
                onTap: () async {
                  _birthDay.text = await selectDate(context, _birthDay.text);
                },
              ),
              CustomFormField(
                label: 'E-mail',
                isReadOnly: true,
                controller: _email,
              ),
              CustomFormField(
                label: 'Telefone Fixo',
                isReadOnly: false,
                controller: _phone,
                inputType: TextInputType.number,
                formatterList: [DataFormatters().brazilianPhoneMask],
              ),
              CustomFormField(
                label: 'Telefone Celular',
                isReadOnly: false,
                controller: _cellphone,
                inputType: TextInputType.number,
                formatterList: [DataFormatters().brazilianCellphoneMask],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
