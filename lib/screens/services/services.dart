import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:the_walking_pets/data/service_data.dart';
import 'package:the_walking_pets/model/service.dart';
import 'package:the_walking_pets/screens/services/services_filter.dart';
import 'package:the_walking_pets/screens/services/services_page.dart';
import 'package:the_walking_pets/widgets/curve_clipper.dart';
import 'package:the_walking_pets/widgets/custom_drawer.dart';

class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final Geolocator geolocator = Geolocator();
  Position? _currentPosition;
  bool loading = true;
  int limitDistance = 50;

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'pt_BR';
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;

        setState(() {
          loading = false;
        });
      });
    }).catchError((e) {
      const SnackBar(
        content: Text('Erro ao capturar localização atual'),
      );
    });
  }

  _servicesList() {
    if (!loading) {
      List<Service> list = serviceData(context)
          .where((element) =>
              _positionDistance(
                _currentPosition,
                element.coordLat,
                element.coordLng,
              ) <
              limitDistance)
          .toList();

      return Container(
        margin: EdgeInsets.only(
          top: ((MediaQuery.of(context).size.height / 7) - 24),
        ),
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return serviceInfoTile(
              context,
              _currentPosition,
              list.elementAt(index),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  _openFilter(BuildContext context) async {
    limitDistance = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ServicesFilter(),
      ),
    );

    setState(() {
      _servicesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serviços'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent.shade400,
        foregroundColor: Colors.white,
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            // BOTTOM CLIPPATH
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 7,
                color: Colors.lightBlueAccent.shade700,
              ),
            ),

            // GRID ANIMALS
            _servicesList(),

            // TOP CLIPPATH
            ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: (MediaQuery.of(context).size.height / 7) - 16.0,
                width: double.infinity,
                color: Colors.lightBlueAccent.shade400,
              ),
            ),

            // FILTER BUTTON CONTAINER
            SizedBox(
              height: 50.0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _openFilter(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.filter_list_alt),
                      Text('Filtro'),
                    ],
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(128, 48.0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

serviceInfoTile(
  BuildContext context,
  currentPosition,
  Service data,
) {
  return ListTile(
    leading: Icon(data.categoria.icone),
    title: Text(data.nome),
    subtitle: Text(data.categoria.titulo),
    trailing: Text(
      '${_positionDistance(currentPosition, data.coordLat, data.coordLng).toString()} km',
    ),

    // trailing: Text(''),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ServicesPage(serviceData: data),
        ),
      );
    },
  );
}

int _positionDistance(currentPosition, serviceLat, serviceLng) {
  final formatter = NumberFormat.decimalPattern();

  final calculate = Geolocator.distanceBetween(
    currentPosition.latitude,
    currentPosition.longitude,
    serviceLat,
    serviceLng,
  ).floor();

  int formattedNumber = double.parse(formatter.format(calculate)).round();

  return formattedNumber;
}
