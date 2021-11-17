import 'package:flutter/material.dart';
import 'package:the_walking_pets/constants/app_constants.dart';
import 'package:the_walking_pets/core/auth/signup/common_signup.dart';

class Explanation extends StatefulWidget {
  const Explanation({Key? key, required this.isPartner}) : super(key: key);

  final bool isPartner;
  @override
  _ExplanationState createState() => _ExplanationState();
}

class _ExplanationState extends State<Explanation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(widget.isPartner ? 'Parceiro' : 'Comum'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignupPage(
                    isPartner: widget.isPartner,
                  ),
                ),
              );
            },
            child: const Text(
              'Continuar',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Hero(
                  tag: widget.isPartner,
                  child: Image.asset(
                    widget.isPartner
                        ? 'assets/images/blue/animal_shelter_bro.png'
                        : 'assets/images/blue/adopt_a_pet_bro.png',
                  ),
                ),
                Text(
                  widget.isPartner ? partnerExplanation : commonExplanation,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
