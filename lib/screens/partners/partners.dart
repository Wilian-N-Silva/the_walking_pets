import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:the_walking_pets/data/partners/partner_data.dart';
import 'package:the_walking_pets/model/services/service.dart';
import 'package:the_walking_pets/model/services/service_filter.dart';
import 'package:the_walking_pets/screens/partners/partners_filter.dart';
import 'package:the_walking_pets/screens/partners/partners_page.dart';
import 'package:the_walking_pets/widgets/curve_clipper.dart';
import 'package:the_walking_pets/widgets/custom_drawer.dart';

class Partners extends StatefulWidget {
  const Partners({Key? key}) : super(key: key);

  @override
  _PartnersState createState() => _PartnersState();
}

class _PartnersState extends State<Partners> {
  final Geolocator geolocator = Geolocator();
  Position? _currentPosition;
  bool loading = true;
  final Filter defaultFilter = Filter(maxDistance: 100);

  Filter currentFilter = Filter(maxDistance: 50);

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

  _partnersList() {
    if (!loading) {
      List<Partner> list = partnerData(context)
          .where((element) =>
              _positionDistance(
                _currentPosition,
                element.coordLat,
                element.coordLng,
              ) <
              currentFilter.maxDistance)
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
            return partnerInfoTile(
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
    currentFilter = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PartnersFilter(
              currentFilter: currentFilter,
            ),
          ),
        ) ??
        defaultFilter;

    setState(() {
      _partnersList();
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

            // LIST SERVICES
            _partnersList(),

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

partnerInfoTile(
  BuildContext context,
  currentPosition,
  Partner data,
) {
  return ListTile(
    leading: Icon(data.categoria.icone),
    title: Text(data.nome),
    subtitle: Text(data.categoria.titulo),
    trailing: Text(
      '${_positionDistance(currentPosition, data.coordLat, data.coordLng).toString()} km',
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PartnersPage(partnerData: data),
        ),
      );
    },
  );
}

int _positionDistance(currentPosition, partnerPosLat, partnerPosLng) {
  final formatter = NumberFormat.decimalPattern();

  final calculate = Geolocator.distanceBetween(
    currentPosition.latitude,
    currentPosition.longitude,
    partnerPosLat,
    partnerPosLng,
  ).floor();

  int formattedNumber = double.parse(formatter.format(calculate)).round();

  return formattedNumber;
}
