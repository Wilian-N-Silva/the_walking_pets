import 'package:flutter/material.dart';
import 'package:the_walking_pets/services/via_cep_service.dart';
import 'package:the_walking_pets/util/data_formatter.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';

class AddLocal extends StatefulWidget {
  const AddLocal({Key? key}) : super(key: key);

  @override
  _AddLocalState createState() => _AddLocalState();
}

class _AddLocalState extends State<AddLocal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cep = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Local'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customFormField(
                  label: 'CEP',
                  action: TextInputAction.search,
                  formatterList: [DataFormatters().brazilianPostalCode],
                  onSubmited: (value) async {
                    if (value.length == 9) {
                      final result = await ViaCepService.fetchCep(
                        cep: value.replaceAll('-', ''),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
