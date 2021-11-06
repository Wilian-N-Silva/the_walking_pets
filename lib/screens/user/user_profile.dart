import 'package:flutter/material.dart';
import 'package:the_walking_pets/utilities/helpers/fakedata/profile_options.dart';
import 'package:the_walking_pets/model/profile_options.dart';

import 'package:the_walking_pets/widgets/custom_drawer.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: profileOptions.length,
          itemBuilder: (BuildContext context, int index) {
            return OptionTile(option: profileOptions.elementAt(index));
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            thickness: 1,
          ),
        ),
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  const OptionTile({
    Key? key,
    required this.option,
  }) : super(key: key);

  final ProfileSettings option;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(option.icon),
      title: Text(option.title),
      subtitle: option.subtitle != null ? Text(option.subtitle!) : null,
      isThreeLine: false,
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => option.route,
          ),
        );
      },
    );
  }
}
