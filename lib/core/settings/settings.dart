import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    String? _chosenValue;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          DropdownButtonFormField<String>(
            focusColor: Colors.white,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            value: _chosenValue,
            //elevation: 5,
            style: const TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>[
              'Claro',
              'Escuro',
              'Padrão do Sistema',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            hint: const Text(
              "Please choose a langauage",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String? value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        ]),
      ),
    );
  }
}
