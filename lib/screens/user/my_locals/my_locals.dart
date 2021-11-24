import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/util/address.dart';
import 'package:the_walking_pets/screens/user/my_locals/add_local.dart';
import 'package:the_walking_pets/screens/user/user_profile.dart';
import 'package:the_walking_pets/utilities/services/user_rest_api.dart';
import 'package:the_walking_pets/utilities/ui/circular_loading.dart';

class MyLocals extends StatefulWidget {
  const MyLocals({Key? key, required this.donation}) : super(key: key);
  final bool donation;
  @override
  _MyLocalsState createState() => _MyLocalsState();
}

class _MyLocalsState extends State<MyLocals> {
// getAddressesByUser

  bool isLoading = false;
  bool requestError = false;
  List<Address> _addresses = [];

  @override
  void initState() {
    super.initState();
    _getAddressList();
  }

  _getAddressList() {
    isLoading = true;

    UserAPI.getAddressesByUser().then((response) {
      var body = json.decode(response.body);

      setState(() {
        isLoading = false;

        if (response.statusCode == 200) {
          _addresses = body['addresses'] != null
              ? body['addresses']
                  .map<Address>((json) => Address.fromMap(json))
                  .toList()
              : [];
        } else {
          requestError = true;
          SnackBar snackBar = SnackBar(
            content: Text('Erro: ${body['error'].toString()}'),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Locais'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const UserProfile(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddLocal(),
                ),
              );
            },
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: isLoading
            ? const CircularLoading()
            : _addresses.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(requestError
                          ? 'Erro ao listar animais cadastrados'
                          : 'Não há Pets cadastrados'),
                      if (!requestError)
                        ElevatedButton(
                          child: const Text('Adicionar Pet'),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddLocal(),
                            ),
                          ),
                        )
                      else
                        ElevatedButton(
                            child: const Text('Voltar'),
                            onPressed: () => Navigator.pop)
                    ],
                  )
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _addresses.length,
                    itemBuilder: (BuildContext context, int index) {
                      Address data = _addresses[index];
                      return ListTile(
                        onTap: () {
                          widget.donation
                              ? Navigator.pop(
                                  context,
                                  data,
                                )
                              : null;
                        },
                        title: Text(
                          '${data.address}, ${data.number}',
                        ),
                        subtitle: Text(
                          '${data.neighborhood}, ${data.location} - ${data.state}',
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      thickness: 1,
                    ),
                  ),
      ),
    );
  }
}
