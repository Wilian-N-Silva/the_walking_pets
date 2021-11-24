import 'package:flutter/material.dart';
import 'package:the_walking_pets/screens/user/my_adoptions/adoption_progress.dart';

class AdoptionList extends StatefulWidget {
  const AdoptionList({Key? key}) : super(key: key);

  @override
  _AdoptionListState createState() => _AdoptionListState();
}

class _AdoptionListState extends State<AdoptionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text('Status'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdoptionProgress(
                  status: 4,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
