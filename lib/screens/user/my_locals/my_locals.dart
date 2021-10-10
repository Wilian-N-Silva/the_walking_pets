import 'package:flutter/material.dart';
import 'package:the_walking_pets/screens/user/my_locals/add_local.dart';

class MyLocals extends StatefulWidget {
  const MyLocals({Key? key}) : super(key: key);

  @override
  _MyLocalsState createState() => _MyLocalsState();
}

enum MenuItems { favoritar, excluir }

class _MyLocalsState extends State<MyLocals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Locais'),
        centerTitle: true,
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
      body: SafeArea(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Local ${index + 1}'),
              contentPadding: const EdgeInsets.all(16.0),
              leading: Icon(
                index == 0 ? Icons.star_border : Icons.star,
              ),
              trailing: PopupMenuButton<MenuItems>(
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<MenuItems>>[
                  const PopupMenuItem<MenuItems>(
                    value: MenuItems.favoritar,
                    child: Text('Favoritar'),
                  ),
                  const PopupMenuItem<MenuItems>(
                    value: MenuItems.excluir,
                    child: Text('Excluir'),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
