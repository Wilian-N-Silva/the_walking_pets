import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:the_walking_pets/util/cellphone_formatter.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class MyData extends StatefulWidget {
  const MyData({Key? key}) : super(key: key);

  @override
  _MyDataState createState() => _MyDataState();
}

class _MyDataState extends State<MyData> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _birthDay = TextEditingController();
  final TextEditingController _name = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _saveData() {
    print(_name.text);
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
              customFormField(
                label: 'Nome completo',
                controller: _name,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  decoration: const InputDecoration(
                      label: Text('Data de Nascimento'),
                      border: OutlineInputBorder(),
                      hintText: 'dd/MM/aaaa'),
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, preencha o campo';
                    }
                    return null;
                  },
                  controller: _birthDay,
                  onTap: () {
                    _selectDate(context);
                  },
                ),
              ),
              customFormField(
                label: 'E-mail',
                isReadOnly: true,
              ),
              customFormField(
                  label: 'Celular',
                  isReadOnly: false,
                  inputType: TextInputType.number,
                  formatterList: [brazilianCelphoneMask]),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      initializeDateFormatting();
      _birthDay.text =
          DateFormat('dd/MM/yyyy').format(_selectedDate).toString();
    }
  }
}
