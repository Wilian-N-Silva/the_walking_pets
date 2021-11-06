import 'package:flutter/material.dart';

class SignupOnboarding extends StatefulWidget {
  const SignupOnboarding({Key? key}) : super(key: key);

  @override
  _SignupOnboardingState createState() => _SignupOnboardingState();
}

class _SignupOnboardingState extends State<SignupOnboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
