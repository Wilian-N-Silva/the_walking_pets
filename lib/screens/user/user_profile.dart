import 'package:flutter/material.dart';
import 'package:the_walking_pets/screens/user/my_pets.dart';
import 'package:the_walking_pets/widgets/custom_drawer.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class ProfileSettings {
  ProfileSettings({
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final IconData icon;
  final Widget route;
}

List<ProfileSettings> profileSettings(BuildContext context) {
  return [
    ProfileSettings(
      title: 'Meus Pets',
      icon: Icons.pets,
      route: const MyPets(),
    ),
    ProfileSettings(
      title: 'Meus Locais',
      icon: Icons.pin_drop,
      route: const UserProfile(),
    ),
    ProfileSettings(
      title: 'Adoção',
      icon: Icons.favorite,
      route: const UserProfile(),
    ),
    ProfileSettings(
      title: 'Doação',
      icon: Icons.home,
      route: const UserProfile(),
    ),
    ProfileSettings(
      title: 'Achados e Perdidos',
      icon: Icons.screen_search_desktop_outlined,
      route: const UserProfile(),
    ),
  ];
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent.shade400,
        foregroundColor: Colors.white,
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // GRID ANIMALS
            GridView.count(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: profileSettings(context).map<Widget>((option) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => option.route,
                      ),
                    );
                  },
                  child: GridTile(
                    footer: Material(
                      color: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(16.0),
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: GridTileBar(
                        title: Text(
                          option.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: const BorderSide(
                          color: Colors.black26,
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Icon(
                        option.icon,
                        size: 80.0,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
