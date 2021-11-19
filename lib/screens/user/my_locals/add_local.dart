import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_walking_pets/constants/app_constants.dart';
import 'package:the_walking_pets/model/util/address.dart';
import 'package:the_walking_pets/model/util/location_lat_lng.dart';
import 'package:the_walking_pets/model/util/result_viacep.dart';
import 'package:the_walking_pets/screens/user/my_locals/my_locals.dart';
import 'package:the_walking_pets/utilities/helpers/fakedata/user_data.dart';
import 'package:the_walking_pets/utilities/services/user_rest_api.dart';
import 'package:the_walking_pets/utilities/services/via_cep_service.dart';
import 'package:the_walking_pets/utilities/helpers/data_formatter.dart';
import 'package:the_walking_pets/widgets/custom_form_field.dart';
import 'package:http/http.dart' as http;

class AddLocal extends StatefulWidget {
  const AddLocal({Key? key}) : super(key: key);

  @override
  _AddLocalState createState() => _AddLocalState();
}

class _AddLocalState extends State<AddLocal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cep = TextEditingController();
  final TextEditingController _number = TextEditingController();
  ResultViacep _viaCepResponse = ResultViacep();
  LocationLatLng _locationLatLng = LocationLatLng();
  Address _address = Address();
  bool _isLoading = false;

  _getLatLng() async {
    _parseAddress().then((response) {
      var body = json.decode(response.body);

      _locationLatLng =
          LocationLatLng.fromMap(body['results'][0]['geometry']['location']);

      _buildAddress();
    });
  }

  Future _parseAddress() async {
    String query =
        '${_viaCepResponse.logradouro}, ${_viaCepResponse.bairro}, ${_viaCepResponse.localidade} - ${_viaCepResponse.uf}';
    return await http.get(
      Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$query&key=$googleMapsAPIKey',
      ),
    );
  }

  _saveData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      _buildAddress();

      UserAPI.insertAddress(_address).then((response) {
        setState(() {
          _isLoading = false;
        });

        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyLocals(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Local'),
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
                    'Inserindo novo endereço!',
                    style: TextStyle(fontSize: 24.0),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomFormField(
                            label: 'CEP',
                            controller: _cep,
                            isRequired: true,
                            action: TextInputAction.search,
                            formatterList: [
                              DataFormatters().brazilianPostalCode
                            ],
                            onSubmited: (value) async {
                              if (value.length == 9) {
                                var response = await ViaCepService.fetchCep(
                                  cep: value.replaceAll('-', ''),
                                );

                                setState(() {
                                  _viaCepResponse = response;
                                });

                                _getLatLng();
                              }
                            },
                          ),
                          if (_address.postalCode != null)
                            CustomFormField(
                              label: 'Número',
                              controller: _number,
                              isRequired: true,
                              inputType: TextInputType.number,
                            ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _address.postalCode != null,
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text('Logradouro'),
                            subtitle: Text(_address.address ?? ''),
                          ),
                          ListTile(
                            title: const Text('Bairro'),
                            subtitle: Text(_address.neighborhood ?? ''),
                          ),
                          ListTile(
                            title: const Text('Localidade'),
                            subtitle: Text(
                              _address.postalCode != null
                                  ? '${_address.location} - ${_address.state}'
                                  : '',
                            ),
                          ),
                          ListTile(
                            title: const Text('Localização'),
                            subtitle: Text(
                              _address.postalCode != null
                                  ? '${_address.lat}, ${_address.lng}'
                                  : '',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  void _buildAddress() {
    setState(() {
      _address = Address(
        uid: currentUser.id,
        postalCode: _viaCepResponse.cep,
        neighborhood: _viaCepResponse.bairro,
        address: _viaCepResponse.logradouro,
        state: _viaCepResponse.uf,
        location: _viaCepResponse.localidade,
        lat: _locationLatLng.lat,
        lng: _locationLatLng.lng,
        number: _number.text,
      );
    });
  }
}
