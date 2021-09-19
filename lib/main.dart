import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_walking_pets/screens/login.dart';
import 'package:the_walking_pets/screens/home.dart';
import 'package:the_walking_pets/screens/home_filter.dart';
import 'package:the_walking_pets/screens/onboarding/step_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Walking Pets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingStepOne(),
    );
  }
}
