import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_walking_pets/model/service.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key, required this.serviceData}) : super(key: key);

  final Service serviceData;

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    final serviceData = widget.serviceData;
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
