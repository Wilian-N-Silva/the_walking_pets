import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/widgets/curve_clipper.dart';

class _Tile {
  _Tile({
    required this.title,
    required this.leading,
  });

  final String title;
  final IconData leading;
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<_Tile> tileDataSource = [
    _Tile(
      title: 'Adoção',
      leading: Icons.favorite,
    ),
    _Tile(
      title: 'Doação',
      leading: Icons.home,
    ),
    _Tile(
      title: 'Achados e Perdidos',
      leading: Icons.screen_search_desktop_outlined,
    ),
    _Tile(
      title: 'Serviços',
      leading: Icons.store,
    ),
    _Tile(
      title: 'Configurações',
      leading: Icons.settings,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 140.0),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 64),
              physics: const BouncingScrollPhysics(),
              itemCount: tileDataSource.length,
              itemBuilder: (BuildContext context, int index) {
                return drawerItemTile(
                  tileDataSource[index].title,
                  tileDataSource[index].leading,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              height: 220,
              color: Colors.blue.shade700,
            ),
          ),
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              height: 205,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      'P',
                      style: TextStyle(fontSize: 32.0),
                    ),
                    radius: 50.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Olá,',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Peter',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget drawerItemTile(String title, IconData leading) {
  return ListTile(
    leading: Icon(leading),
    title: Text(title),
    onTap: () {},
  );
}
