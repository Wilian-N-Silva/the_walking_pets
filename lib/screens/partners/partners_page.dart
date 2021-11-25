import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_walking_pets/model/services/service.dart';
import 'package:the_walking_pets/utilities/helpers/map_utils.dart';

class PartnerData {
  PartnerData({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final IconData icon;
}

class PartnersPage extends StatefulWidget {
  const PartnersPage({Key? key, required this.partnerData}) : super(key: key);

  final Partner partnerData;

  @override
  _PartnersPageState createState() => _PartnersPageState();
}

class _PartnersPageState extends State<PartnersPage> {
  @override
  Widget build(BuildContext context) {
    final List<PartnerData> tileDataSource = [
      PartnerData(
        title: 'Categoria',
        subtitle: widget.partnerData.categoria.titulo,
        icon: widget.partnerData.categoria.icone,
      ),
      PartnerData(
        title: 'Endereço',
        subtitle:
            '${widget.partnerData.address}, ${widget.partnerData.number}, ${widget.partnerData.neighborhood}, ${widget.partnerData.location} - ${widget.partnerData.state}',
        icon: Icons.pin_drop,
      ),
      PartnerData(
          title: 'Funcionamento',
          subtitle: 'Segunda a Sexta - 07:00 às 23:00',
          icon: Icons.watch_later_outlined)
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.partnerData.nome),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent.shade400,
        actions: [
          IconButton(
            onPressed: () async {
              shareServiceProfile(context, widget.partnerData);
            },
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemCount: tileDataSource.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(tileDataSource[index].title),
                  subtitle: Text(tileDataSource[index].subtitle),
                  leading: Icon(tileDataSource[index].icon),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
            ElevatedButton(
              child: const Text('Como chegar'),
              onPressed: () => MapUtils.openMap(
                widget.partnerData.lat,
                widget.partnerData.lng,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> shareServiceProfile(BuildContext context, Partner serviceName) {
  return Share.share(
    'Aqui vai uma recomendação de ${serviceName.categoria.titulo}. Confere mais detalhes lá no The Walking Pets!\nhttps://www.thewalkingpets.com.br/service/id',
  );
}
