import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:the_walking_pets/constants/app_constants.dart';
import 'package:the_walking_pets/core/auth/signup/explanation.dart';

class SignupOnboarding extends StatefulWidget {
  const SignupOnboarding({Key? key}) : super(key: key);

  @override
  _SignupOnboardingState createState() => _SignupOnboardingState();
}

class _SignupOnboardingState extends State<SignupOnboarding> {
  _signupType({bool isPartner = false}) {
    return GestureDetector(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          children: [
            Text(isPartner ? 'Parceiro' : 'Comum'),
            SizedBox(
              height: (MediaQuery.of(context).size.height / 3) - 25.0,
              child: Hero(
                tag: isPartner,
                child: Image.asset(
                  isPartner
                      ? 'assets/images/blue/animal_shelter_bro.png'
                      : 'assets/images/blue/adopt_a_pet_bro.png',
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Explanation(
            isPartner: isPartner,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  registerIntro,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                  ),
                ),
              ),
              _signupType(),
              _signupType(isPartner: true),
            ],
          ),
        ),
      ),
    );
  }
}
