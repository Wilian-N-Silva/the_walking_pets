import 'package:flutter/material.dart';

class AddMultipleDonation extends StatefulWidget {
  const AddMultipleDonation({Key? key}) : super(key: key);

  @override
  _AddMultipleDonationState createState() => _AddMultipleDonationState();
}

class _AddMultipleDonationState extends State<AddMultipleDonation> {
  _animalSelection() {
    return GridTile(
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          splashColor: Theme.of(context).primaryColor.withAlpha(75),
          highlightColor: Colors.transparent,
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleção de animais'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Selecionando mais de um animal, a doação conjunta estará habilitada, estando inicialmente limitado a dois animais',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16.0),
            GridView.count(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: List.generate(2, (index) {
                return _animalSelection();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
