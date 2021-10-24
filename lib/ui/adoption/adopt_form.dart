import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class AdoptionForm extends StatefulWidget {
  const AdoptionForm({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  _AdoptionFormState createState() => _AdoptionFormState();
}

class _AdoptionFormState extends State<AdoptionForm> {
  final TextEditingController _userName = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _saveUser() {
    if (_formKey.currentState!.validate()) {
      print("Name ${_userName.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    Animal animal = widget.animal;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Adoção'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              _saveUser();
            },
            child: const Text(
              'Enviar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: ClipOval(
                  child: Image.asset(
                    animal.foto,
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Dados do Adotante',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              customFormField(
                label: 'Nome',
                controller: _userName,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Dados do Animal',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              customFormField(
                label: 'Nome',
                value: animal.nome ?? 'Sem nome',
                isReadOnly: false,
              ),
              customFormField(label: 'Espécie', value: animal.especie),
            ],
          ),
        ),
      ),
    );
  }
}
