import 'package:flutter/material.dart';
import 'package:the_walking_pets/core/settings/settings.dart';
import 'package:the_walking_pets/screens/adoption/adoption.dart';
import 'package:the_walking_pets/screens/lost_and_found/lost_and_found.dart';
import 'package:the_walking_pets/screens/partners/partners.dart';
import 'package:the_walking_pets/screens/user/user_profile.dart';
import 'package:the_walking_pets/widgets/curve_clipper.dart';

class _Tile {
  _Tile({
    required this.title,
    required this.leading,
    required this.route,
  });

  final String title;
  final IconData leading;
  final Widget route;
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<_Tile> tileDataSource = [
    _Tile(
      title: 'Meu Perfil',
      leading: Icons.person,
      route: const UserProfile(),
    ),
    _Tile(
      title: 'Adoção',
      leading: Icons.favorite,
      route: const Adoption(),
    ),
    _Tile(
      title: 'Doação',
      leading: Icons.home,
      route: const Adoption(),
    ),
    _Tile(
      title: 'Achados e Perdidos',
      leading: Icons.screen_search_desktop_outlined,
      route: const LostAndFound(),
    ),
    _Tile(
      title: 'Serviços',
      leading: Icons.store,
      route: const Partners(),
    ),
    _Tile(
      title: 'Configurações',
      leading: Icons.settings,
      route: const Settings(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 7 + 24,
            ),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 64),
              physics: const BouncingScrollPhysics(),
              itemCount: tileDataSource.length,
              itemBuilder: (BuildContext context, int index) {
                return drawerItemTile(
                  context,
                  tileDataSource[index].title,
                  tileDataSource[index].leading,
                  tileDataSource[index].route,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),

          // BOTTOM WAVE CLIPPATH
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              height: (MediaQuery.of(context).size.height / 4.5) + 32.0,
              color: Colors.lightBlueAccent.shade700,
            ),
          ),

          // TOP WAVE CLIPPATH
          ClipPath(
            clipper: CurveClipper(),
            child: Container(
              height: (MediaQuery.of(context).size.height / 4.5) + 16,
              width: double.infinity,
              color: Colors.lightBlueAccent.shade400,
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // USER IMAGE
                  // const CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   child: Text(
                  //     'P',
                  //     style: TextStyle(fontSize: 32.0),
                  //   ),
                  //   radius: 50.0,
                  // ),
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

Widget drawerItemTile(
  BuildContext context,
  String title,
  IconData leading,
  Widget route,
) {
  return ListTile(
    leading: Icon(leading),
    title: Text(title),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ),
      );
    },
  );
}
