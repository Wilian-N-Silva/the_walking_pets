import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_walking_pets/model/services/service.dart';

class PartnersPage extends StatefulWidget {
  const PartnersPage({Key? key, required this.partnerData}) : super(key: key);

  final Partner partnerData;

  @override
  _PartnersPageState createState() => _PartnersPageState();
}

class _PartnersPageState extends State<PartnersPage> {
  @override
  Widget build(BuildContext context) {
    final serviceData = widget.partnerData;
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceData.nome),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent.shade400,
        actions: [
          IconButton(
            onPressed: () async {
              shareServiceProfile(context, serviceData.nome);
            },
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}

Future<void> shareServiceProfile(BuildContext context, String serviceName) {
  return Share.share(
    'Aqui vai uma recomendação de {categoria}. Confere mais detalhes lá no The Walking Pets!\nhttps://www.thewalkingpets.com.br/service/id',
  );
}
