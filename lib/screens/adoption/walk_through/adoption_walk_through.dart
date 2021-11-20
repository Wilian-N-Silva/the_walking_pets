import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:the_walking_pets/constants/app_constants.dart';
import 'package:the_walking_pets/model/animal/animal.dart';
import 'package:the_walking_pets/screens/adoption/adopt_form.dart';

class AdoptionWalkThrough extends StatefulWidget {
  const AdoptionWalkThrough({Key? key, required this.animal}) : super(key: key);

  final Animal animal;

  @override
  _AdoptionWalkThroughState createState() => _AdoptionWalkThroughState();
}

class _AdoptionWalkThroughState extends State<AdoptionWalkThrough> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdoptionForm(
                    animal: widget.animal,
                  ),
                ),
              );
            },
            child: const Text(
              'Pular',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height) / 2,
              child: const RiveAnimation.asset(
                'assets/animations/blue/cat_with_a_witch_hat_cuate.riv',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Hey, sou eu o $appPetName!',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Pensou que eu era um cachorro, né? Eu sei, todo mundo pensa isso! haha',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: RichText(
                text: TextSpan(
                    text:
                        'Sei que está ansioso para adotar ${widget.animal.gender == 1 ? 'o' : 'a'} ',
                    style: Theme.of(context).textTheme.headline5,
                    children: <TextSpan>[
                      TextSpan(
                        text: '${widget.animal.name}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text:
                            ', mas você precisa saber de algumas coisinhas antes continuar, ta bom?',
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
